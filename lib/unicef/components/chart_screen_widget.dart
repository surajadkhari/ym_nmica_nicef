import 'package:charts_flutter/flutter.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:unicef/unicef/models/chart.dart';
import 'package:unicef/unicef/services/chart2_service.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// ignore: must_be_immutable
class ChartScreenWidget extends StatefulWidget {
  List<int>? ids;
  int? id;
  int? indicatorClusterId;
  String? indicatorCode;
  String? name;
  String? description;
  String? module;
  List? charts;

  ChartScreenWidget({
    Key? key,
    this.ids,
    this.id,
    this.indicatorClusterId,
    this.indicatorCode,
    this.name,
    this.description,
    this.module,
    this.charts,
  }) : super(key: key);

  @override
  _ChartScreenWidgetState createState() => _ChartScreenWidgetState();
}

class _ChartScreenWidgetState extends State<ChartScreenWidget> {
  List<charts.Series<dynamic, String>>? _seriesLineData;
  List<charts.Series<BarGraph, String>>? _barSeriesData;

  Chart2Service _chart2service = Chart2Service();
  Future<List<Chart>>? futureChart;
  List<Feature> features = [];
  List<LineChart> lineChart = [];
  @override
  void initState() {
    super.initState();
    futureChart = _chart2service.fetchCharts(this.widget.ids!);
    // ignore: deprecated_member_usec
    _seriesLineData = <charts.Series<dynamic, String>>[];
    _barSeriesData = <charts.Series<BarGraph, String>>[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          const SizedBox(height: 2),
          // MaterialButton(
          //   onPressed: () {
          //     _chart2service.getChartsData(this.widget.ids!);
          //   },
          //   color: Colors.blue,
          //   child: Text('Fetch Chart'),
          // ),
          Expanded(
            child: FutureBuilder<List<Chart>>(
              future: futureChart,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      List<LineChart> linesData = [];
                      List<LineChart> chartsData = [];
                      List<BarGraph> chartsBarData = [];

                      List<String> keys = [];
                      List chartElements = [];
                      List chartTypes = [];

                      Chart datar = snapshot.data![index];

                      if (datar.chartType == "bar_graph") {
                        var jsom =
                            snapshot.data![index].charts![index].toJson();
                        jsom.forEach((key, value) {
                          if (key != 'label') {
                            // keys['color'] =  "red";'

                            chartsBarData
                                .add(BarGraph(key, double.parse(value)));

                            _barSeriesData!.add(
                              charts.Series(
                                domainFn: (BarGraph pollution, _) =>
                                    pollution.type.toString(),
                                measureFn: (BarGraph pollution, _) =>
                                    pollution.value,
                                id: '1',
                                data: chartsBarData,
                              ),
                            );
                            var parsedKey = value;
                            print(parsedKey);
                          }
                        });
                        chartsData.forEach((element) {});
                        print(chartsData);

                        return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              height: 500,
                              width: 500,
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: charts.BarChart(
                                        _barSeriesData!,
                                        animate: true,
                                        animationDuration: Duration(seconds: 5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      } else if (snapshot.data![index].chartType ==
                          "bar_graph") {
                        var chart = snapshot.data![index].charts;
                        chart!.map((e) => {print(e)});
                        return Text(
                            snapshot.data![index].charts![0].nepal.toString());
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          // Expanded(
          //   child: FutureBuilder<List<Chart>>(
          //       future: futureChart,
          //       builder: (context, snapshot) {
          //         if (snapshot.hasData) {
          //           // List<Chart>? data = snapshot.data;
          //           return ListView.builder(
          //               itemCount: snapshot.data!.length,
          //               itemBuilder: (BuildContext context, int index) {
          //                 List<LineChart> linesData = [];
          //                 linesData.add(LineChart(
          //                     snapshot.data![index].charts![index].bagmati, 1));
          //                 print(snapshot.data![index].chartType);
          //                 if (snapshot.data![index].chartType.toString() ==
          //                     'line_graph') {
          //                   // setState(
          //                   //   () {
          //                   //     _seriesLineData.add(
          //                   //       charts.Series(
          //                   //         colorFn: (__, _) =>
          //                   //             charts.ColorUtil.fromDartColor(
          //                   //                 Colors.black),
          //                   //         id: '1',
          //                   //         data: linesData,
          //                   //         domainFn: (LineChart lineChart, _) =>
          //                   //             lineChart.value!,
          //                   //         measureFn: (LineChart lineChart, _) =>
          //                   //             lineChart.value,
          //                   //       ),
          //                   //     );
          //                   //   },
          //                   // );
          //                   return Container(
          //                     child: SingleChildScrollView(
          //                       child: Padding(
          //                         padding: EdgeInsets.all(8.0),
          //                         child: Container(
          //                           child: Center(
          //                             child: Column(
          //                               children: <Widget>[
          //                                 Text('Sales for the first 5 years'),
          //                                 Expanded(
          //                                     child: charts.LineChart(
          //                                         _seriesLineData,
          //                                         defaultRenderer: new charts
          //                                                 .LineRendererConfig(
          //                                             includeArea: true,
          //                                             stacked: true),
          //                                         animate: true,
          //                                         animationDuration:
          //                                             Duration(seconds: 5),
          //                                         behaviors: [
          //                                       new charts.ChartTitle('Years',
          //                                           behaviorPosition: charts
          //                                               .BehaviorPosition
          //                                               .bottom,
          //                                           titleOutsideJustification:
          //                                               charts
          //                                                   .OutsideJustification
          //                                                   .middleDrawArea),
          //                                       new charts.ChartTitle('Sales',
          //                                           behaviorPosition: charts
          //                                               .BehaviorPosition.start,
          //                                           titleOutsideJustification:
          //                                               charts
          //                                                   .OutsideJustification
          //                                                   .middleDrawArea),
          //                                       new charts.ChartTitle(
          //                                         'Departments',
          //                                         behaviorPosition: charts
          //                                             .BehaviorPosition.end,
          //                                         titleOutsideJustification:
          //                                             charts
          //                                                 .OutsideJustification
          //                                                 .middleDrawArea,
          //                                       )
          //                                     ]))
          //                               ],
          //                             ),
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                   );
          //                 } else {
          //                   return Text(("Unsppurted chart type"));
          //                 }
          //               });
          //         } else {
          //           return Center(child: CircularProgressIndicator());
          //         }
          //       }),
          // )
        ],
      ),
    );
  }
}

class LineChart {
  String? type;
  double? value;

  LineChart(
    this.type,
    this.value,
  );
}

class BarGraph {
  String? type;
  double? value;

  BarGraph(
    this.type,
    this.value,
  );
}
