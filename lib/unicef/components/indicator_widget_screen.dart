import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:unicef/unicef/screens/chart_screen.dart';
import 'package:unicef/unicef/services/indicator_services.dart';
import 'package:unicef/unicef/widgets/CheckBoxState.dart';

// ignore: must_be_immutable
class IndicatorScreenWidget extends StatefulWidget {
  int id;
  String name;

  IndicatorScreenWidget({required this.id, required this.name});

  @override
  _IndicatorScreenWidgetState createState() => _IndicatorScreenWidgetState();
}

class _IndicatorScreenWidgetState extends State<IndicatorScreenWidget> {
  IndicatorServices _indicatorService = IndicatorServices();
  Future<List<CheckBoxState>>? futureData;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    checkInternet();
    futureData = _indicatorService.fetchIndicators(this.widget.id);
  }

  List<int> _checkBoxList = [];
  var r;
  checkInternet() async {
    r = await Connectivity().checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              this.widget.name,
              style: TextStyle(color: Colors.blue, fontSize: 20.0),
            ),
          ),
          const SizedBox(height: 2),
          Expanded(
            child: FutureBuilder<List<CheckBoxState>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var ind = index + 1;
                      var name = data[index].name!;

                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 25,
                          right: 25,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 20,
                                  color: Color(0xFF013856).withAlpha(25),
                                  offset: Offset(0, 10))
                            ],
                            // color: HexColor(
                            //   widget.color.toString(),
                            // ),
                            // Colors.primaries[Random().nextInt(Colors.primaries.length)],
                          ),
                          child: CheckboxListTile(
                            title: Text(
                              "$ind.  $name",
                              style: TextStyle(
                                  fontSize: 15.0, fontFamily: "Brand-Bold"),
                            ),
                            value: data[index].value,
                            onChanged: (val) {
                              var id = data[index].id;
                              if (val!) {
                                _checkBoxList.add(id!);
                                setState(() {
                                  data[index].value = val;
                                });
                              } else {
                                _checkBoxList.remove(id!);
                                setState(() {
                                  data[index].value = val;
                                });
                              }
                            },
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10, right: 20, left: 20),
            child: Container(
              height: 50,
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  _scrollController
                      .animateTo(_scrollController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 100),
                          curve: Curves.bounceOut)
                      .then((value) => Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => ChartScreen(
                                ids: _checkBoxList,
                                name: this.widget.name,
                              ),
                            ),
                          ));
                },
                child: const Center(
                  child: Text(
                    "View Profile",
                    style: TextStyle(fontSize: 15.0, fontFamily: "Brand-Bold"),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
