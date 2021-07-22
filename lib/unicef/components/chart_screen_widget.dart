import 'package:flutter/material.dart';

import 'package:unicef/common/utils/size_configs.dart';
import 'package:unicef/unicef/models/chart.dart';
import 'package:unicef/unicef/services/chart2_service.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
  // List<charts.Series<dynamic, num>>? _seriesLineData;
  List<charts.Series<BarGraph, String>>? _barSeriesData;
  List<charts.Series<PieChart, String>>? _pieSeriesData;

  Chart2Service _chart2service = Chart2Service();
  Future<List<Chart>>? futureChart;
  @override
  void initState() {
    super.initState();

    futureChart = _chart2service.fetchCharts(this.widget.ids!);
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
                            // _seriesLineData = <charts.Series<dynamic, num>>[];
                            _pieSeriesData =
                                <charts.Series<PieChart, String>>[];

                            List<LineChartDraw> chartsData = [];
                            List<BarGraph> chartsBarData = [];
                            List<PieChart> chartsPieData = [];
                            List<LineChartDraw> _lineChart = [];

                            // List<LineChartDraw> chartsLineData = [];
                            List<List<BarGraph>> allData = [];
                            List<List<PieChart>> allPieData = [];
                            // List<List<charts.PieChart>> allPieData = [];
                            // List<List<LineChartDraw>> allLineData = [];

                            Chart datar = snapshot.data![index];

                            if (datar.chartType == "bar_graph") {
                              ScreenshotController screenshotController =
                                  ScreenshotController();
                              // List<ChartElement>? datas =
                              //     snapshot.data![index].charts;

                              var count = 0;

                              while (count <
                                  snapshot.data![index].charts!.length) {
                                var label = "";
                                var jsom = snapshot.data![index].charts![count]
                                    .toJson();

                                jsom.forEach((key, value) {
                                  if (key != 'label') {
                                    // keys['color'] =  "red";'

                                    chartsBarData.add(
                                        BarGraph(key, double.parse(value)));
                                  } else {
                                    label = value;
                                  }
                                });
                                allData.add(chartsBarData.toList());

                                _barSeriesData!.add(
                                  charts.Series(
                                    domainFn: (BarGraph barGraph, _) =>
                                        barGraph.type.toString(),
                                    measureFn: (BarGraph barGraph, _) =>
                                        barGraph.value,
                                    id: label,
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
                                        child: Screenshot(
                                          controller: screenshotController,
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
                                                      outsideJustification: charts
                                                          .OutsideJustification
                                                          .startDrawArea,
                                                      horizontalFirst: false,
                                                      desiredMaxRows: 2,
                                                    )
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
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            } else if (datar.chartType == "line_graph") {
                              ScreenshotController screenshotController =
                                  ScreenshotController();
                              var count = 0;

                              while (count <
                                  snapshot.data![index].charts!.length) {
                                var label = "";
                                var jsom = snapshot.data![index].charts![count]
                                    .toJson();

                                jsom.forEach(
                                  (key, value) {
                                    if (key != 'label') {
                                      _lineChart.add(
                                        LineChartDraw(
                                          key,
                                          double.parse(value),
                                        ),
                                      );
                                      print(key);
                                    } else {
                                      label = value;
                                      //  print(label);
                                    }
                                  },
                                );

                                count++;
                              }
                              chartsData.forEach((element) {});
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height:
                                              getProportionateScreenHeight(400),
                                          width:
                                              getProportionateScreenWidth(500),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border:
                                                Border.all(color: Colors.blue),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Screenshot(
                                                  controller:
                                                      screenshotController,
                                                  child: Container(
                                                    height: 300,
                                                    width:
                                                        getProportionateScreenWidth(
                                                            900),
                                                    child: SfCartesianChart(
                                                      primaryXAxis:
                                                          CategoryAxis(),
                                                      // Chart title
                                                      title: ChartTitle(
                                                          text: snapshot
                                                              .data![index]
                                                              .name!),
                                                      // Enable legend

                                                      // Enable tooltip
                                                      tooltipBehavior:
                                                          TooltipBehavior(
                                                              enable: true),
                                                      series: <
                                                          ChartSeries<
                                                              LineChartDraw,
                                                              String>>[
                                                        LineSeries<
                                                            LineChartDraw,
                                                            String>(
                                                          dataSource:
                                                              _lineChart,
                                                          xValueMapper:
                                                              (LineChartDraw
                                                                          sales,
                                                                      _) =>
                                                                  sales.type,
                                                          yValueMapper:
                                                              (LineChartDraw
                                                                          sales,
                                                                      _) =>
                                                                  sales.value,
                                                          name: snapshot
                                                              .data![index]
                                                              .name!,
                                                          // Enable data label
                                                          dataLabelSettings:
                                                              DataLabelSettings(
                                                                  isVisible:
                                                                      true),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(snapshot
                                                  .data![index].description!)
                                            ],
                                          )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else if (datar.chartType == "pie_chart") {
                              // List<ChartElement>? datas =
                              //     snapshot.data![index].charts;
                              ScreenshotController screenshotController =
                                  ScreenshotController();

                              var count = 0;

                              while (count <
                                  snapshot.data![index].charts!.length) {
                                var label = "";
                                var jsom = snapshot.data![index].charts![count]
                                    .toJson();

                                jsom.forEach((key, chartper) {
                                  if (key != 'label') {
                                    // keys['color'] =  "red";'

                                    chartsPieData.add(
                                        PieChart(key, double.parse(chartper)));
                                  } else {
                                    label = chartper;
                                    print(chartper);
                                  }
                                });
                                allPieData.add(chartsPieData.toList());
                                //print(chartsPieData);
                                _pieSeriesData!.add(
                                  charts.Series(
                                    domainFn: (PieChart barGraph, _) =>
                                        barGraph.name!,
                                    measureFn: (PieChart barGraph, _) =>
                                        barGraph.value,
                                    labelAccessorFn: (PieChart pieChart, _) =>
                                        '${pieChart.value}',
                                    id: label,
                                    data: chartsPieData,
                                  ),
                                );

                                count++;
                              }
                              chartsPieData.forEach((element) {});
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        height:
                                            getProportionateScreenHeight(400),
                                        width:
                                            getProportionateScreenHeight(400),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          border:
                                              Border.all(color: Colors.blue),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Screenshot(
                                              controller: screenshotController,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(snapshot
                                                      .data![index].name!),
                                                  SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Container(
                                                          color: Colors.white,
                                                          height:
                                                              getProportionateScreenHeight(
                                                                  280),
                                                          width:
                                                              getProportionateScreenWidth(
                                                                  176),
                                                          child: charts.PieChart(
                                                              _pieSeriesData!,
                                                              animate: true,
                                                              animationDuration:
                                                                  Duration(
                                                                      seconds:
                                                                          5),
                                                              behaviors: [
                                                                new charts
                                                                    .DatumLegend(
                                                                  outsideJustification: charts
                                                                      .OutsideJustification
                                                                      .endDrawArea,
                                                                  horizontalFirst:
                                                                      false,
                                                                  desiredMaxRows:
                                                                      2,
                                                                  cellPadding: new EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          4.0,
                                                                      bottom:
                                                                          4.0),
                                                                  entryTextStyle: charts.TextStyleSpec(
                                                                      color: charts
                                                                          .MaterialPalette
                                                                          .black,
                                                                      fontFamily:
                                                                          'Georgia',
                                                                      fontSize:
                                                                          11),
                                                                )
                                                              ],
                                                              defaultRenderer:
                                                                  new charts
                                                                          .ArcRendererConfig(
                                                                      arcWidth:
                                                                          100,
                                                                      arcRendererDecorators: [
                                                                    new charts
                                                                            .ArcLabelDecorator(
                                                                        labelPosition: charts
                                                                            .ArcLabelPosition
                                                                            .outside)
                                                                  ]))),
                                                    ),
                                                  ),
                                                  Text(snapshot.data![index]
                                                      .description!),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Center(
                                  child: Text("Unsupported Chart type"));
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

class LineChartDraw {
  String type;
  double? value;

  LineChartDraw(
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

class PieChart {
  String? name;
  double? value;

  PieChart(this.name, this.value);
}
