import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:unicef/unicef/models/Indicators.dart';
import 'package:unicef/unicef/services/indicator_services.dart';
import 'package:unicef/unicef/widgets/CheckBoxState.dart';

// ignore: must_be_immutable
class IndicatorScreenWidget extends StatefulWidget {
  int? id;
  String? name;

  IndicatorScreenWidget({
    required this.id,
    required this.name,
  });

  @override
  _IndicatorScreenWidgetState createState() => _IndicatorScreenWidgetState();
}

class _IndicatorScreenWidgetState extends State<IndicatorScreenWidget> {
  IndicatorServices _indicatorService = IndicatorServices();
  Future<List<CheckBoxState>>? futureData;

  @override
  void initState() {
    super.initState();
    futureData = _indicatorService.fetchCheckBoxState();
    //  getAllClusterIndicators();
  }

  //var _indicatorList = [];
  List<int> _checkBoxList = [];

  // getAllClusterIndicators() async {
  //   var isCacheExist =
  //       await APICacheManager().isAPICacheKeyExist(this.widget.name!);
  //   if (!isCacheExist) {
  //     print("Api Hit");
  //     var clusters =
  //         await _indicatorService.getClusterIndicators(this.widget.id);
  //     var result = json.decode(clusters.body);
  //     APICacheDBModel cacheDBModel =
  //         new APICacheDBModel(key: this.widget.name!, syncData: clusters.body);
  //     await APICacheManager().addCacheData(cacheDBModel);
  //     result['data'].forEach((data) {
  //       var model = Indicator();
  //       model.id = data['id'];
  //       model.name = data['name'];
  //       setState(() {
  //         _indicatorList.add(model);
  //       });
  //       _checkBoxList.add(CheckBoxState(data: data));
  //     });
  //   } else {
  //     print("cache Hit");
  //     var cachedData = await APICacheManager().getCacheData(this.widget.name!);
  //     var result = json.decode(cachedData.syncData);
  //     result['data'].forEach((data) {
  //       var model = Indicator();
  //       model.id = data['id'];
  //       model.name = data['name'];
  //       setState(() {
  //         _indicatorList.add(model);
  //       });
  //       _checkBoxList.add(CheckBoxState(name: data['name'], id: data['id']));
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              this.widget.name!,
              style: TextStyle(color: Colors.blue, fontSize: 20.0),
            ),
          ),
          const SizedBox(height: 2),
          Expanded(
            child: FutureBuilder<List<CheckBoxState>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<CheckBoxState>? data = snapshot.data;
                  return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CheckboxListTile(
                        title: Text(data[index].name!),
                        value: data[index].value,
                        onChanged: (val) {
                          setState(() {
                            data[index].value = val;
                            var id = data[index].id;
                            if (val!) {
                              _checkBoxList.add(id!);
                            } else {
                              _checkBoxList.remove(id!);
                            }
                            print(_checkBoxList);
                          });
                        },
                      );
                      // return Container(
                      //   height: 75,
                      //   color: Colors.white,
                      //   child: Center(
                      //     child: Text(data[index].name!),
                      //   ),
                      // );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default show a loading spinner.
                return Center(child: CircularProgressIndicator());
              },

              // child: ListView(
              //     // children: [..._checkBoxList.map(buildingDingleCheckBox).toList()],
              //     ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ButtonBar(),
          )
        ],
      ),
    );
  }

  // Widget buildingDingleCheckBox(CheckBoxState checkBoxState) =>
  //     CheckboxListTile(
  //       value: checkBoxState.data,
  //       title: Text(checkBoxState.name!),
  //       onChanged: (value) => setState(
  //         () {
  //           checkBoxState.value = value!;
  //         },
  //       ),
  //     );
}
