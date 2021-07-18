import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:unicef/common/utils/size_configs.dart';
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
  List<charts.Series>? _seriesLineData;
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
    // _seriesLineData = <charts.Series<LineChart, String>>[];
    // _barSeriesData = <charts.Series<BarGraph, String>>[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                FutureBuilder<List<Chart>>(
                  future: futureChart,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: getProportionateScreenHeight(700),
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            _barSeriesData =
                                <charts.Series<BarGraph, String>>[];
                            _seriesLineData = <charts.Series>[];
                            // List<LineChart> linesData = [];
                            List<LineChart> chartsData =
                                []; //yaha bhitra add garne ho
                            List<BarGraph> chartsBarData = [];
                            List<LineChart> chartsLineData = [];
                            List<List<BarGraph>> allData = [];
                            List<List<LineChart>> allLineData = [];
                            List<Color> colors = [Colors.red, Colors.green];
                            // List<String> keys = [];
                            // List chartElements = [];
                            // List chartTypes = [];

                            Chart datar = snapshot.data![index];

                            if (datar.chartType == "bar_graph") {
                              List<ChartElement>? datas =
                                  snapshot.data![index].charts;

                              var count = 0;

                              while (count <
                                  snapshot.data![index].charts!.length) {
                                var jsom = snapshot.data![index].charts![count]
                                    .toJson();
                                var label = "";

                                jsom.forEach((key, value) {
                                  if (key != 'label') {
                                    // keys['color'] =  "red";'

                                    chartsBarData.add(BarGraph(colors[count],
                                        key, double.parse(value)));
                                  } else {
                                    label = value;
                                  }
                                });
                                allData.add(chartsBarData.toList());

                                _barSeriesData!.add(
                                  charts.Series(
                                    colorFn: (BarGraph barGraph, _) =>
                                        charts.ColorUtil.fromDartColor(
                                            barGraph.color!),
                                    domainFn: (BarGraph barGraph, _) =>
                                        barGraph.type.toString(),
                                    measureFn: (BarGraph barGraph, _) =>
                                        barGraph.value,
                                    id: label + index.toString(),
                                    data: allData[count],
                                  ),
                                );

                                count++;
                              }
                              chartsData.forEach((element) {});
                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(color: Colors.blue),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(snapshot.data![index].name!),
                                            Container(
                                              height:
                                                  getProportionateScreenHeight(
                                                      300),
                                              width:
                                                  getProportionateScreenWidth(
                                                      500),
                                              child: charts.BarChart(
                                                _barSeriesData!,
                                                animate: true,
                                                animationDuration:
                                                    Duration(seconds: 5),
                                                barGroupingType: charts
                                                    .BarGroupingType.grouped,
                                                behaviors: [
                                                  new charts.SeriesLegend(
                                                    position: charts
                                                        .BehaviorPosition.end,
                                                    horizontalFirst: false,
                                                    cellPadding:
                                                        new EdgeInsets.only(
                                                            right: 4.0,
                                                            bottom: 4.0),
                                                    showMeasures: false,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(snapshot
                                                .data![index].description!),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            } else if (datar.chartType == "line_graph") {
                              List<ChartElement>? datas =
                                  snapshot.data![index].charts;

                              var count = 0;

                              while (count <
                                  snapshot.data![index].charts!.length) {
                                var jsom = snapshot.data![index].charts![count]
                                    .toJson();
                                var label = "";

                                jsom.forEach((key, value) {
                                  if (key != 'label') {
                                    // keys['color'] =  "red";'

                                    chartsLineData.add(
                                        LineChart(key, double.parse(value)));
                                  } else {
                                    label = value;
                                  }
                                });
                                allLineData.add(chartsLineData.toList());

                                _seriesLineData!.add(
                                  charts.Series(
                                    domainFn: (LineChart lineChart, _) =>
                                        lineChart.value.toInt()!,
                                    measureFn: (LineChart barGraph, _) =>
                                        barGraph.value,
                                    id: label + index.toString(),
                                    data: allLineData[count],
                                  ),
                                );

                                count++;
                              }
                              chartsData.forEach((element) {});
                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(color: Colors.blue),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(snapshot.data![index].name!),
                                            Container(
                                              height:
                                                  getProportionateScreenHeight(
                                                      300),
                                              width:
                                                  getProportionateScreenWidth(
                                                      500),
                                              child: charts.LineChart(
                                                domainFn:
                                                    (LineChart lineChart, _) =>
                                                        lineChart.type,
                                                measureFn:
                                                    (LineChart lineChart, _) =>
                                                        lineChart.value,
                                                data: _seriesLineData,
                                              ),
                                            ),
                                            Text(snapshot
                                                .data![index].description!),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )
              ],
            ),
          ),
        ),
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
  Color? color;
  String? type;
  double? value;

  BarGraph(
    this.color,
    this.type,
    this.value,
  );
}
