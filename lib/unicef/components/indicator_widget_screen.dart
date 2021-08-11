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

  @override
  void initState() {
    super.initState();
    futureData = _indicatorService.fetchIndicators(this.widget.id);
  }

  List<int> _checkBoxList = [];

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
                    itemCount: data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CheckboxListTile(
                        title: Text(data[index].name!),
                        value: data[index].value,
                        onChanged: (val) {
                          var id = data[index].id;
                          if (val!) {
                            _checkBoxList.add(id!);
                            setState(() {
                              data[index].value = val;
                            });
                            // _checkBoxList.removeAt(index);
                          } else {
                            _checkBoxList.remove(id!);
                            setState(() {
                              data[index].value = val;
                            });
                            print(_checkBoxList);
                          }
                        },
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
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => ChartScreen(
                      ids: _checkBoxList,
                      name: this.widget.name,
                    ),
                  ),
                );
              },
              child: const Center(
                child: Text(
                  "View Profile",
                  style: TextStyle(fontSize: 18.0, fontFamily: "Brand-Bold"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
