import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:unicef/common/utils/size_configs.dart';
import 'package:unicef/unicef/components/drawer.dart';
import 'package:unicef/unicef/models/chart.dart';
import 'package:unicef/unicef/screens/notifications.dart';
import 'package:unicef/unicef/services/chart2_service.dart';

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
  List<charts.Series<BarGraph, String>>? _barSeries2014Data;
  List<charts.Series<BarGraph, String>>? _barSeriesNepalData;
  List<charts.Series<PieChart, String>>? _pieSeriesData;

  Chart2Service _chart2service = Chart2Service();
  Future<List<Chart>>? futureChart;
  String data = 'all';
  String year = '2019';

  @override
  void initState() {
    super.initState();

    futureChart = _chart2service.fetchNewCharts(this.widget.ids!);
    getPrefrence();
  }

  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }

  getPrefrence() async {
    final prefs = await SharedPreferences.getInstance();
    final isCached = prefs.getString('data');
    final isYear = prefs.getString('year');
    if (isCached == null) {
      data = "all";
      year = "2019";
    } else {
      setState(() {
        data = isCached;
        year = isYear!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/mic_logo.png',
            fit: BoxFit.contain,
            height: 20,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => NotificationScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
          bottom: TabBar(
            // indicatorColor: Colors.red,
            unselectedLabelColor: Colors.blue,

            labelColor: Colors.black,
            automaticIndicatorColorAdjustment: true,
            tabs: [
              Tab(
                text: "Chart",
              ),
              Tab(
                text: "Table",
              ),
            ],
          ),
        ),
        drawer: DrawerNavigation(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.name.toString(),
                style: TextStyle(fontSize: 17, overflow: TextOverflow.clip),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder<List<Chart>>(
                              future: futureChart,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    height: getProportionateScreenHeight(650),
                                    width: double.infinity,
                                    // color: Colors.red,
                                    child: ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        _barSeriesData =
                                            <charts.Series<BarGraph, String>>[];
                                        _barSeries2014Data =
                                            <charts.Series<BarGraph, String>>[];

                                        _barSeriesNepalData =
                                            <charts.Series<BarGraph, String>>[];
                                        _pieSeriesData =
                                            <charts.Series<PieChart, String>>[];

                                        List<LineChartDraw> chartsData = [];
                                        List<BarGraph> chartsBarData = [];
                                        List<BarGraph> charts2014BarData = [];
                                        List<BarGraph> chartsNepalBarData = [];
                                        List<PieChart> chartsPieData = [];
                                        List<LineChartDraw> _lineChart = [];

                                        List<List<BarGraph>> allData = [];
                                        List<List<BarGraph>> all2014Data = [];
                                        List<List<BarGraph>> allNepalData = [];
                                        List<List<PieChart>> allPieData = [];

                                        Chart datar = snapshot.data![index];

                                        if (datar.chartType == "bar_graph") {
                                          var count = 0;
                                          bool show = true;
                                          var label = "";
                                          var width = 600.0;
                                          var width2 = 200.0;

                                          while (count <
                                              snapshot.data![index].charts!
                                                  .length) {
                                            var jsom = snapshot
                                                .data![index].charts![count]
                                                .toJson();
                                            jsom.forEach((key, value) {
                                              if (key != 'label' &&
                                                  key != 'data_2014') {
                                                print(
                                                    "Series length ---------");
                                                print(_barSeriesData!.length);
                                                print("----------");
                                                print("------value length");
                                                print(value.length);
                                                print("------value length");

                                                if (data == "Nepal") {
                                                  chartsBarData.add(BarGraph(
                                                      key,
                                                      double.parse(value)));
                                                  if (_barSeriesData!.length ==
                                                      1) {
                                                    show = true;
                                                    if (value.length > 90) {
                                                      width = 800.0;
                                                      width2 = 400.0;
                                                    } else if (value.length >
                                                        50) {
                                                      width = 800.0;
                                                      width2 = 300.0;
                                                    } else if (value.length >
                                                        20) {
                                                      width = 600.0;
                                                      width2 = 200.0;
                                                    } else if (value.length >
                                                        14) {
                                                      width = 550.0;
                                                      width2 = 150.0;
                                                    } else if (value.length >
                                                        4) {
                                                      width = 300.0;
                                                      width2 = 150.0;
                                                    } else if (value.length >
                                                        2) {
                                                      width = 500.0;
                                                      width2 = 150.0;
                                                    }
                                                  }
                                                  if (_barSeriesData!.length ==
                                                      2) {
                                                    show = true;

                                                    if (value.length > 90) {
                                                      width = 800.0;
                                                      width2 = 400.0;
                                                    } else if (value.length >
                                                        50) {
                                                      width = 800.0;
                                                      width2 = 300.0;
                                                    } else if (value.length >
                                                        20) {
                                                      width = 600.0;
                                                      width2 = 200.0;
                                                    } else if (value.length >
                                                        14) {
                                                      width = 550.0;
                                                      width2 = 150.0;
                                                    } else if (value.length >
                                                        2) {
                                                      width = 1500.0;
                                                      width2 = 1500.0;
                                                    }
                                                  }
                                                  if (_barSeriesData!.length ==
                                                      0) {
                                                    show = false;
                                                    width = 600.0;
                                                    width2 = 500.0;
                                                    if (value.length == 4) {
                                                      if (year == '2019') {
                                                        width = 800.0;
                                                        width2 = 600.0;
                                                      } else if (year ==
                                                          '2014') {
                                                        show = true;

                                                        width = 100.0;
                                                        width2 = 200.0;
                                                      } else if (year ==
                                                          'Trend') {
                                                        show = true;

                                                        width = 500.0;
                                                        width2 = 200.0;
                                                      }
                                                    }
                                                  }

                                                  if (_barSeriesData!.length ==
                                                      3) {
                                                    show = true;

                                                    if (value.length > 90) {
                                                      width = 800.0;
                                                      width2 = 400.0;
                                                    } else if (value.length >
                                                        50) {
                                                      width = 800.0;
                                                      width2 = 300.0;
                                                    } else if (value.length >
                                                        20) {
                                                      width = 600.0;
                                                      width2 = 200.0;
                                                    } else if (value.length >
                                                        14) {
                                                      width = 550.0;
                                                      width2 = 150.0;
                                                    } else if (value.length ==
                                                        3) {
                                                      width = 1500.0;
                                                      width2 = 1500.0;
                                                    } else if (value.length ==
                                                        4) {
                                                      width = 2400.0;
                                                      width2 = 1500.0;
                                                    } else if (value.length >
                                                        2) {
                                                      width = 1500.0;
                                                      width2 = 800.0;
                                                    }
                                                  }

                                                  if (_barSeriesData!.length ==
                                                      4) {
                                                    show = true;
                                                    if (value.length > 90) {
                                                      width = 1500.0;
                                                      width2 = 800.0;
                                                    } else if (value.length >
                                                        50) {
                                                      width = 800.0;
                                                      width2 = 300.0;
                                                    } else if (value.length >
                                                        20) {
                                                      width = 600.0;
                                                      width2 = 200.0;
                                                    } else if (value.length >
                                                        14) {
                                                      width = 800.0;
                                                      width2 = 250.0;
                                                    } else if (value.length ==
                                                        4) {
                                                      print("object");
                                                      width = 800.0;
                                                      width2 = 250.0;
                                                    } else if (value.length ==
                                                        3) {
                                                      width = 2400.0;
                                                      width2 = 1500.0;
                                                    } else if (value.length >
                                                        2) {
                                                      width = 500.0;
                                                      width2 = 150.0;
                                                    }
                                                  }
                                                  print(width);
                                                  print(width2);

                                                  if (_barSeriesData!.length ==
                                                      1) {
                                                    show = true;
                                                    if (value.length > 90) {
                                                      width = 1500.0;
                                                      width2 = 800.0;
                                                    } else if (value.length >
                                                        50) {
                                                      width = 800.0;
                                                      width2 = 300.0;
                                                    } else if (value.length >
                                                        20) {
                                                      width = 600.0;
                                                      width2 = 200.0;
                                                    } else if (value.length >
                                                        14) {
                                                      width = 800.0;
                                                      width2 = 250.0;
                                                    } else if (value.length >
                                                        2) {
                                                      width = 1500.0;
                                                      width2 = 500.0;
                                                    } else if (value.length ==
                                                        0) {
                                                      width = 800.0;
                                                      width2 = 200.0;
                                                    }
                                                  }
                                                } else {
                                                  print("------value length");
                                                  print(value.length);
                                                  print("------value length");

                                                  if (key == data) {
                                                    chartsBarData.add(BarGraph(
                                                        key,
                                                        double.parse(value)));
                                                    if (_barSeriesData!
                                                            .length ==
                                                        1) {
                                                      show = true;
                                                      if (value.length > 90) {
                                                        width = 800.0;
                                                        width2 = 400.0;
                                                      } else if (value.length >
                                                          50) {
                                                        width = 800.0;
                                                        width2 = 300.0;
                                                      } else if (value.length >
                                                          20) {
                                                        width = 600.0;
                                                        width2 = 200.0;
                                                      } else if (value.length >
                                                          14) {
                                                        width = 550.0;
                                                        width2 = 150.0;
                                                      } else if (value.length ==
                                                          4) {
                                                        width = 250.0;
                                                        width2 = 400.0;
                                                        if (year == "Trend") {
                                                          width = 100.0;
                                                          width2 = 100.0;
                                                        }
                                                      } else if (value.length ==
                                                          3) {
                                                        width = 1500.0;
                                                        width2 = 700.0;
                                                      } else if (value.length >
                                                          2) {
                                                        width = 500.0;
                                                        width2 = 150.0;
                                                      }
                                                    }
                                                    if (_barSeriesData!
                                                            .length ==
                                                        2) {
                                                      show = true;
                                                      // width = 650.0;
                                                      // width2 = 200.0;

                                                      if (value.length > 90) {
                                                        width = 800.0;
                                                        width2 = 400.0;
                                                      } else if (value.length >
                                                          50) {
                                                        width = 800.0;
                                                        width2 = 300.0;
                                                      } else if (value.length >
                                                          20) {
                                                        width = 600.0;
                                                        width2 = 200.0;
                                                      } else if (value.length >
                                                          14) {
                                                        width = 550.0;
                                                        width2 = 150.0;
                                                      } else if (value.length ==
                                                          3) {
                                                        width = 1000.0;
                                                        width2 = 250.0;
                                                      } else if (value.length ==
                                                          4) {
                                                        width = 1100.0;
                                                        width2 = 600.0;
                                                      } else if (value.length >
                                                          2) {
                                                        width = 500.0;
                                                        width2 = 150.0;
                                                      }
                                                    }
                                                    if (_barSeriesData!
                                                            .length ==
                                                        0) {
                                                      show = false;
                                                      width = 100.0;
                                                      width2 = 80.0;
                                                    }

                                                    if (_barSeriesData!
                                                            .length ==
                                                        3) {
                                                      show = true;

                                                      if (value.length > 90) {
                                                        width = 800.0;
                                                        width2 = 400.0;
                                                      } else if (value.length >
                                                          50) {
                                                        width = 800.0;
                                                        width2 = 300.0;
                                                      } else if (value.length >
                                                          20) {
                                                        width = 600.0;
                                                        width2 = 200.0;
                                                      } else if (value.length >
                                                          14) {
                                                        width = 550.0;
                                                        width2 = 150.0;
                                                      } else if (value.length ==
                                                          4) {
                                                        width = 1000.0;
                                                        width2 = 400.0;
                                                      } else if (value.length >
                                                          2) {
                                                        width = 500.0;
                                                        width2 = 150.0;
                                                      }

                                                      if (_barSeriesData!
                                                              .length ==
                                                          4) {
                                                        show = true;
                                                        if (value.length > 90) {
                                                          width = 800.0;
                                                          width2 = 400.0;
                                                        } else if (value
                                                                .length >
                                                            50) {
                                                          width = 800.0;
                                                          width2 = 300.0;
                                                        } else if (value
                                                                .length >
                                                            20) {
                                                          width = 600.0;
                                                          width2 = 200.0;
                                                        } else if (value
                                                                .length >
                                                            14) {
                                                          width = 800.0;
                                                          width2 = 250.0;
                                                        } else if (value
                                                                .length ==
                                                            3) {
                                                          width = 1800.0;
                                                          width2 = 400.0;
                                                        } else if (value
                                                                .length ==
                                                            4) {
                                                          print(
                                                              "-------------value length");
                                                        }
                                                        print(value.length);
                                                        print("-------------");
                                                        width = 1800.0;
                                                        width2 = 400.0;
                                                      } else if (value.length >
                                                          2) {
                                                        width = 1800.0;
                                                        width2 = 400.0;
                                                      }
                                                    }
                                                  }
                                                }
                                              } else {
                                                if (key != "data_2014" &&
                                                    key != "Nepal") {
                                                  if (jsom['data_2014'] !=
                                                      0.0) {
                                                    charts2014BarData.add(
                                                        BarGraph(
                                                            "Nepal",
                                                            double.parse(jsom[
                                                                'data_2014'])));

                                                    chartsNepalBarData.add(
                                                        BarGraph(
                                                            'Nepal',
                                                            double.parse(jsom[
                                                                'Nepal'])));
                                                  }
                                                  label = value;
                                                } else if (year == "Trend") {
                                                  charts2014BarData = [];
                                                  charts2014BarData.add(
                                                      BarGraph(
                                                          "2014",
                                                          double.parse(jsom[
                                                              'data_2014'])));

                                                  charts2014BarData.add(
                                                      BarGraph(
                                                          '2019',
                                                          double.parse(
                                                              jsom['Nepal'])));
                                                }
                                              }
                                            });

                                            allData.add(chartsBarData.toList());
                                            all2014Data.add(
                                                charts2014BarData.toList());
                                            allNepalData.add(
                                                chartsNepalBarData.toList());

                                            _barSeriesData!.add(
                                              charts.Series(
                                                domainFn: (BarGraph barGraph,
                                                        _) =>
                                                    barGraph.type.toString(),
                                                measureFn:
                                                    (BarGraph barGraph, _) =>
                                                        barGraph.value!,
                                                labelAccessorFn:
                                                    (BarGraph barGraph, _) =>
                                                        '${barGraph.value}',
                                                id: label,
                                                data: allData[count],
                                              ),
                                            );

                                            _barSeries2014Data!.add(
                                              charts.Series(
                                                domainFn: (BarGraph barGraph,
                                                        _) =>
                                                    barGraph.type.toString(),
                                                measureFn:
                                                    (BarGraph barGraph, _) =>
                                                        barGraph.value!,
                                                labelAccessorFn:
                                                    (BarGraph barGraph, _) =>
                                                        '${barGraph.value}',
                                                id: label,
                                                data: all2014Data[count],
                                              ),
                                            );

                                            _barSeriesNepalData!.add(
                                              charts.Series(
                                                domainFn: (BarGraph barGraph,
                                                        _) =>
                                                    barGraph.type.toString(),
                                                measureFn:
                                                    (BarGraph barGraph, _) =>
                                                        barGraph.value!,
                                                labelAccessorFn:
                                                    (BarGraph barGraph, _) =>
                                                        '${barGraph.value}',
                                                id: label,
                                                data: allNepalData[count],
                                              ),
                                            );

                                            count++;
                                          }

                                          return Column(
                                            children: [
                                              year == "2019"
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Container(
                                                        width:
                                                            getProportionateScreenHeight(
                                                                500),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.white),
                                                          // boxShadow: [
                                                          //   BoxShadow(
                                                          //     color: Colors.grey
                                                          //         .withOpacity(0.1),
                                                          //     spreadRadius: 5,
                                                          //     blurRadius: 7,
                                                          //     // changes position of shadow
                                                          //   ),
                                                          // ],
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20.0),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                "${snapshot.data![index].name!} (2019)",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                              SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      getProportionateScreenHeight(
                                                                          width),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            getProportionateScreenHeight(200),
                                                                        width: data ==
                                                                                "All Province"
                                                                            ? getProportionateScreenWidth(400)
                                                                            : getProportionateScreenWidth(width2),
                                                                        child: show ==
                                                                                true
                                                                            ? charts.BarChart(
                                                                                _barSeriesData!,
                                                                                animate: true,
                                                                                barRendererDecorator: new charts.BarLabelDecorator<String>(),
                                                                                barGroupingType: charts.BarGroupingType.grouped,
                                                                                behaviors: [
                                                                                  new charts.SeriesLegend(
                                                                                    position: charts.BehaviorPosition.end,
                                                                                    outsideJustification: charts.OutsideJustification.start,
                                                                                    horizontalFirst: false,
                                                                                    desiredMaxRows: 4,
                                                                                  )
                                                                                ],
                                                                              )
                                                                            : charts.BarChart(
                                                                                _barSeriesData!,
                                                                                animate: true,
                                                                                barRendererDecorator: new charts.BarLabelDecorator<String>(),
                                                                                barGroupingType: charts.BarGroupingType.grouped,
                                                                              ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10),
                                                                child: Text(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .description!,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .justify,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox(),

                                              // 2014 Data
                                              year == "2014"
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Container(
                                                        width:
                                                            getProportionateScreenWidth(
                                                                200),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.white),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.1),
                                                              spreadRadius: 5,
                                                              blurRadius: 7,
                                                              // changes position of shadow
                                                            ),
                                                          ],
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20.0),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                "${snapshot.data![index].name!} (2014)",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                              SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      getProportionateScreenWidth(
                                                                          200),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            getProportionateScreenHeight(200),
                                                                        width: data ==
                                                                                "All Province"
                                                                            ? getProportionateScreenWidth(400)
                                                                            : getProportionateScreenWidth(width2),
                                                                        child: show ==
                                                                                true
                                                                            ? charts.BarChart(
                                                                                _barSeries2014Data!,
                                                                                animate: true,
                                                                                barRendererDecorator: new charts.BarLabelDecorator<String>(),
                                                                                barGroupingType: charts.BarGroupingType.grouped,
                                                                                behaviors: [
                                                                                  new charts.SeriesLegend(
                                                                                    position: charts.BehaviorPosition.end,
                                                                                    outsideJustification: charts.OutsideJustification.start,
                                                                                    horizontalFirst: false,
                                                                                    desiredMaxRows: 4,
                                                                                  )
                                                                                ],
                                                                              )
                                                                            : charts.BarChart(
                                                                                _barSeries2014Data!,
                                                                                animate: true,
                                                                                barRendererDecorator: new charts.BarLabelDecorator<String>(),
                                                                                barGroupingType: charts.BarGroupingType.grouped,
                                                                              ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox.shrink(),
                                              year == "Trend"
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Container(
                                                        width:
                                                            getProportionateScreenWidth(
                                                                width2),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.white),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.1),
                                                              spreadRadius: 5,
                                                              blurRadius: 7,
                                                              // changes position of shadow
                                                            ),
                                                          ],
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20.0),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                "${snapshot.data![index].name!} (2014 and 2019)",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                              SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      getProportionateScreenWidth(
                                                                          width2),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            getProportionateScreenHeight(200),
                                                                        width: data ==
                                                                                "All Province"
                                                                            ? getProportionateScreenWidth(400)
                                                                            : getProportionateScreenWidth(width2),
                                                                        child: show ==
                                                                                true
                                                                            ? charts.BarChart(
                                                                                _barSeries2014Data!,
                                                                                animate: true,
                                                                                barRendererDecorator: new charts.BarLabelDecorator<String>(),
                                                                                barGroupingType: charts.BarGroupingType.grouped,
                                                                                behaviors: [
                                                                                  new charts.SeriesLegend(
                                                                                    position: charts.BehaviorPosition.end,
                                                                                    outsideJustification: charts.OutsideJustification.start,
                                                                                    horizontalFirst: false,
                                                                                    desiredMaxRows: 6,
                                                                                  )
                                                                                ],
                                                                              )
                                                                            : charts.BarChart(
                                                                                _barSeries2014Data!,
                                                                                animate: true,
                                                                                barRendererDecorator: new charts.BarLabelDecorator<String>(),
                                                                                barGroupingType: charts.BarGroupingType.grouped,
                                                                              ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox.shrink(),

                                              SizedBox(
                                                height: 2,
                                              ),
                                              snapshot.data!.length > 1
                                                  ? Divider(
                                                      height: 1,
                                                      color: Colors.black,
                                                    )
                                                  : SizedBox.shrink(),
                                            ],
                                          );
                                        } else if (datar.chartType ==
                                            "line_graph") {
                                          var count = 0;

                                          while (count <
                                              snapshot.data![index].charts!
                                                  .length) {
                                            var label = "";
                                            var jsom = snapshot
                                                .data![index].charts![count]
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
                                                } else {
                                                  label = value;
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 700,
                                                    width:
                                                        getProportionateScreenWidth(
                                                            500),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      border: Border.all(
                                                          color: Colors.blue),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.1),
                                                          spreadRadius: 5,
                                                          blurRadius: 7,
                                                          offset: Offset(0, 3),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Container(
                                                            height: 540,
                                                            width:
                                                                getProportionateScreenWidth(
                                                                    900),
                                                            child:
                                                                SfCartesianChart(
                                                              primaryXAxis:
                                                                  CategoryAxis(),
                                                              title: ChartTitle(
                                                                  text: snapshot
                                                                      .data![
                                                                          index]
                                                                      .name!),
                                                              tooltipBehavior:
                                                                  TooltipBehavior(
                                                                      enable:
                                                                          true),
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
                                                                      (LineChartDraw sales,
                                                                              _) =>
                                                                          sales
                                                                              .type,
                                                                  yValueMapper:
                                                                      (LineChartDraw sales,
                                                                              _) =>
                                                                          sales
                                                                              .value,
                                                                  name: snapshot
                                                                      .data![
                                                                          index]
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
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(snapshot
                                                        .data![index]
                                                        .description!),
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Divider(
                                                    height: 5,
                                                    color: Colors.black,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        } else if (datar.chartType ==
                                            "pie_chart") {
                                          var count = 0;

                                          while (count <
                                              snapshot.data![index].charts!
                                                  .length) {
                                            var label = "";
                                            var jsom = snapshot
                                                .data![index].charts![count]
                                                .toJson();

                                            jsom.forEach((key, chartper) {
                                              if (key != 'label') {
                                                chartsPieData.add(PieChart(key,
                                                    double.parse(chartper)));
                                              } else {
                                                label = chartper;
                                              }
                                            });
                                            allPieData
                                                .add(chartsPieData.toList());

                                            _pieSeriesData!.add(
                                              charts.Series(
                                                domainFn:
                                                    (PieChart barGraph, _) =>
                                                        barGraph.name!,
                                                measureFn:
                                                    (PieChart barGraph, _) =>
                                                        barGraph.value!,
                                                labelAccessorFn:
                                                    (PieChart pieChart, _) =>
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      height: 500,
                                                      width:
                                                          getProportionateScreenWidth(
                                                              500),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        border: Border.all(
                                                            color: Colors.blue),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.1),
                                                            spreadRadius: 5,
                                                            blurRadius: 7,
                                                            offset: Offset(0,
                                                                3), // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        child: Column(
                                                          children: [
                                                            SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      snapshot
                                                                          .data![
                                                                              index]
                                                                          .name!,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20)),
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              4.0),
                                                                      child:
                                                                          Container(
                                                                              color: Colors
                                                                                  .white,
                                                                              height:
                                                                                  400,
                                                                              width: getProportionateScreenWidth(
                                                                                  176),
                                                                              child: charts.PieChart(
                                                                                  _pieSeriesData!,
                                                                                  animate:
                                                                                      true,
                                                                                  animationDuration: Duration(
                                                                                      seconds:
                                                                                          5),
                                                                                  behaviors: [
                                                                                    new charts.DatumLegend(
                                                                                      outsideJustification: charts.OutsideJustification.startDrawArea,
                                                                                      horizontalFirst: false,
                                                                                      desiredMaxRows: 2,
                                                                                      cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                                                                                      entryTextStyle: charts.TextStyleSpec(color: charts.MaterialPalette.black, fontFamily: 'Georgia', fontSize: 6),
                                                                                    )
                                                                                  ],
                                                                                  defaultRenderer: new charts.ArcRendererConfig(arcWidth: 100, arcRendererDecorators: [
                                                                                    new charts.ArcLabelDecorator(labelPosition: charts.ArcLabelPosition.inside)
                                                                                  ]))),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(snapshot
                                                      .data![index]
                                                      .description!),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Divider(
                                                  height: 5,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          return Center(
                                              child: Text(
                                                  "Unsupported Chart type"));
                                        }
                                      },
                                    ),
                                  );
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Tables Data
                  SingleChildScrollView(
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
                                    height: getProportionateScreenHeight(640),
                                    width: double.infinity,
                                    child: ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        _barSeriesData =
                                            <charts.Series<BarGraph, String>>[];
                                        _pieSeriesData =
                                            <charts.Series<PieChart, String>>[];

                                        List<LineChartDraw> chartsData = [];
                                        List<BarGraph> chartsBarData = [];
                                        List<PieChart> chartsPieData = [];

                                        List<List<BarGraph>> allData = [];

                                        var bargraph = <BarGraph2>[];
                                        var bargraph2014 = <BarGraph2>[];

                                        var piechart = <PieChart>[];
                                        var linechart = <LineChartDraw>[];
                                        List<String> pieLabels = ["Area"];
                                        List<String> barLabels = ["Area"];
                                        List<String> barGraphLabels = ["Area"];

                                        getCsv() async {
                                          List<List<dynamic>> rows = [];

                                          rows.add(pieLabels);

                                          for (int i = 0;
                                              i < piechart.length;
                                              i++) {
                                            List<dynamic> row = [];

                                            row.add(piechart[i].name);
                                            row.add(piechart[i].value);
                                            rows.add(row);
                                          }

                                          String dir = '';
                                          if (Platform.isAndroid)
                                            dir =
                                                (await getExternalStorageDirectory())!
                                                    .path;
                                          else if (Platform.isIOS) {
                                            dir =
                                                (await getApplicationDocumentsDirectory())
                                                    .path;
                                          }
                                          var path = "$dir/" +
                                              "nmics" +
                                              DateTime.now()
                                                  .millisecondsSinceEpoch
                                                  .toString() +
                                              ".csv";
                                          File file = File(path);
                                          String csv =
                                              const ListToCsvConverter()
                                                  .convert(rows);
                                          file.writeAsString(csv);
                                          final params = SaveFileDialogParams(
                                              sourceFilePath: file.path);

                                          final filePath =
                                              await FlutterFileDialog.saveFile(
                                                  params: params);
                                        }

                                        getLineCsv() async {
                                          List<List<dynamic>> rows = [];

                                          rows.add(pieLabels);

                                          for (int i = 0;
                                              i < linechart.length;
                                              i++) {
                                            List<dynamic> row = [];

                                            row.add(linechart[i].type);
                                            row.add(linechart[i].value);
                                            rows.add(row);
                                          }

                                          String dir = '';
                                          if (Platform.isAndroid)
                                            dir =
                                                (await getExternalStorageDirectory())!
                                                    .path;
                                          else if (Platform.isIOS) {
                                            dir =
                                                (await getApplicationDocumentsDirectory())
                                                    .path;
                                          }
                                          var path = "$dir/" +
                                              "nmics" +
                                              DateTime.now()
                                                  .millisecondsSinceEpoch
                                                  .toString() +
                                              ".csv";
                                          File file = File(path);
                                          String csv =
                                              const ListToCsvConverter()
                                                  .convert(rows);
                                          file.writeAsString(csv);
                                          final params = SaveFileDialogParams(
                                              sourceFilePath: file.path);

                                          await FlutterFileDialog.saveFile(
                                              params: params);
                                        }

                                        getBarCsv() async {
                                          var li = listConverter(bargraph);
                                          List<List<dynamic>> rows = [];
                                          rows.add(barGraphLabels);

                                          for (int i = 0; i < li.length; i++) {
                                            rows.add(li[i].values);
                                          }

                                          String dir = '';
                                          if (Platform.isAndroid)
                                            dir =
                                                (await getExternalStorageDirectory())!
                                                    .path;
                                          else if (Platform.isIOS) {
                                            dir =
                                                (await getApplicationDocumentsDirectory())
                                                    .path;
                                          }
                                          File file = File("$dir/" +
                                              "nmics" +
                                              DateTime.now()
                                                  .millisecondsSinceEpoch
                                                  .toString() +
                                              ".csv");
                                          String csv =
                                              const ListToCsvConverter()
                                                  .convert(rows);
                                          file.writeAsString(csv);
                                          final params = SaveFileDialogParams(
                                              sourceFilePath: file.path);

                                          final filePath =
                                              await FlutterFileDialog.saveFile(
                                                  params: params);
                                        }

                                        Chart datar = snapshot.data![index];
                                        if (datar.chartType == "pie_chart" ||
                                            datar.chartType == "bar_graph" ||
                                            datar.chartType == "line_graph") {
                                          if (datar.chartType == "pie_chart") {
                                            var count = 0;

                                            while (count <
                                                snapshot.data![index].charts!
                                                    .length) {
                                              var label = "";
                                              var jsom = snapshot
                                                  .data![index].charts![count]
                                                  .toJson();

                                              jsom.forEach((key, value) {
                                                if (key != 'label') {
                                                  // keys['color'] =  "red";'

                                                  chartsBarData.add(BarGraph(
                                                      key,
                                                      double.parse(value)));
                                                  piechart.add(PieChart(key,
                                                      double.parse(value)));
                                                } else {
                                                  label = value;
                                                  pieLabels.add(label);
                                                }
                                              });
                                              allData
                                                  .add(chartsBarData.toList());

                                              _barSeriesData!.add(
                                                charts.Series(
                                                  domainFn: (BarGraph barGraph,
                                                          _) =>
                                                      barGraph.type.toString(),
                                                  measureFn:
                                                      (BarGraph barGraph, _) =>
                                                          barGraph.value!,
                                                  id: label,
                                                  data: allData[count],
                                                ),
                                              );

                                              count++;
                                            }
                                            chartsData.forEach((element) {});
                                            return Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      00.0),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                              snapshot
                                                                  .data![index]
                                                                  .name!,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      20)),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 0),
                                                              child: TextButton(
                                                                onPressed: () {
                                                                  getCsv();
                                                                },
                                                                child: const Text(
                                                                    'Download'),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 1000,
                                                  width:
                                                      getProportionateScreenWidth(
                                                          500),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Container(
                                                      child: DataTable(
                                                          columns: const <
                                                              DataColumn>[
                                                            DataColumn(
                                                              label: Text(
                                                                'Area',
                                                                style: TextStyle(
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic),
                                                              ),
                                                            ),
                                                            DataColumn(
                                                              label: Text(
                                                                'Value',
                                                                style: TextStyle(
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic),
                                                              ),
                                                            ),
                                                          ],
                                                          rows: piechart
                                                              .map(
                                                                (name) =>
                                                                    DataRow(
                                                                  cells: [
                                                                    DataCell(
                                                                      Text(name
                                                                          .name!),
                                                                      showEditIcon:
                                                                          false,
                                                                      placeholder:
                                                                          false,
                                                                    ),
                                                                    DataCell(
                                                                      Text(name
                                                                          .value
                                                                          .toString()),
                                                                      showEditIcon:
                                                                          false,
                                                                      placeholder:
                                                                          false,
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                              .toList()),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: Text(snapshot
                                                      .data![index]
                                                      .description!),
                                                ),
                                                snapshot.data!.length > 1
                                                    ? Divider(
                                                        height: 1,
                                                        color: Colors.black,
                                                      )
                                                    : SizedBox.shrink(),
                                              ],
                                            );
                                          } else if (datar.chartType ==
                                              "line_graph") {
                                            var count = 0;

                                            while (count <
                                                snapshot.data![index].charts!
                                                    .length) {
                                              var label = "";
                                              var jsom = snapshot
                                                  .data![index].charts![count]
                                                  .toJson();

                                              jsom.forEach(
                                                (key, value) {
                                                  if (key != 'label') {
                                                    linechart.add(
                                                      LineChartDraw(
                                                        key,
                                                        double.parse(value),
                                                      ),
                                                    );
                                                    // print(key);
                                                  } else {
                                                    label = value;
                                                    pieLabels.add(label);
                                                  }
                                                },
                                              );

                                              count++;
                                            }
                                            chartsData.forEach((element) {});
                                            return Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(snapshot
                                                            .data![index]
                                                            .name!),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              child: TextButton(
                                                                onPressed: () {
                                                                  getLineCsv();
                                                                },
                                                                child: const Text(
                                                                    'Download'),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 600,
                                                  width:
                                                      getProportionateScreenWidth(
                                                          500),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Container(
                                                      child: DataTable(
                                                          columns: getColums(
                                                              pieLabels),
                                                          rows: linechart
                                                              .map(
                                                                (name) =>
                                                                    DataRow(
                                                                  cells: [
                                                                    DataCell(
                                                                      Text(name
                                                                          .type),
                                                                      showEditIcon:
                                                                          false,
                                                                      placeholder:
                                                                          false,
                                                                    ),
                                                                    DataCell(
                                                                      Text(name
                                                                          .value
                                                                          .toString()),
                                                                      showEditIcon:
                                                                          false,
                                                                      placeholder:
                                                                          false,
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                              .toList()),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Text(snapshot
                                                      .data![index]
                                                      .description!),
                                                ),
                                                Divider(
                                                  height: 5,
                                                  color: Colors.black,
                                                )
                                              ],
                                            );
                                          } else if (datar.chartType ==
                                              "bar_graph") {
                                            var count = 0;

                                            while (count <
                                                snapshot.data![index].charts!
                                                    .length) {
                                              var label = "";
                                              var jsom = snapshot
                                                  .data![index].charts![count]
                                                  .toJson();
                                              jsom.forEach((key, chartper) {
                                                if (key != 'label') {
                                                  if (year == "2019") {
                                                    if (key != "data_2014") {
                                                      if (key == data) {
                                                        bargraph.add(BarGraph2(
                                                          key,
                                                          double.parse(
                                                              jsom[data]),
                                                        ));
                                                      } else if (data ==
                                                          'Nepal') {
                                                        bargraph.add(BarGraph2(
                                                          key,
                                                          double.parse(
                                                              chartper),
                                                        ));
                                                      }
                                                    }
                                                  } else if (year == "Trend") {
                                                    if (key == "data_2014") {
                                                      bargraph.add(BarGraph2(
                                                        "2014",
                                                        double.parse(
                                                            jsom['data_2014']),
                                                      ));
                                                    }
                                                    if (key == "Nepal") {
                                                      bargraph.add(BarGraph2(
                                                        "2019",
                                                        double.parse(chartper),
                                                      ));
                                                    }
                                                  } else if (year == "2014") {
                                                    if (key == "data_2014") {
                                                      bargraph.add(BarGraph2(
                                                        "Nepal",
                                                        double.parse(
                                                            jsom['data_2014']),
                                                      ));
                                                    }
                                                  }
                                                } else {
                                                  barGraphLabels.add(chartper);
                                                }
                                              });

                                              count++;
                                            }
                                            chartsPieData.forEach((element) {});
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "${snapshot.data![index].name!} ($year)",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 0.0),
                                                        child: TextButton(
                                                          onPressed: () {
                                                            getBarCsv();
                                                          },
                                                          child: const Text(
                                                              'Download'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 300,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 2.0,
                                                                  right: 2,
                                                                  bottom: 2),
                                                          child: Text(
                                                            snapshot
                                                                .data![index]
                                                                .description!,
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                year == "2019"
                                                    ? Container(
                                                        height: data == "Nepal"
                                                            ? 500
                                                            : 200,
                                                        width:
                                                            getProportionateScreenWidth(
                                                                500),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(22.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  child: DataTable(
                                                                      columnSpacing: 0,
                                                                      columns: getBarColumns(barGraphLabels),
                                                                      rows: listConverter(bargraph)
                                                                          .map(
                                                                            (singleItem) => DataRow(
                                                                                cells: singleItem.values
                                                                                    .map(
                                                                                      (value) => DataCell(
                                                                                        Text(value.toString()),
                                                                                        showEditIcon: false,
                                                                                        placeholder: false,
                                                                                      ),
                                                                                    )
                                                                                    .toList()),
                                                                          )
                                                                          .toList()),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                year == "2014"
                                                    ? Container(
                                                        height: 200,
                                                        width:
                                                            getProportionateScreenWidth(
                                                                500),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(22.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  child: DataTable(
                                                                      columnSpacing: 0,
                                                                      columns: getBarColumns(barGraphLabels),
                                                                      rows: listConverter(bargraph)
                                                                          .map(
                                                                            (singleItem) => DataRow(
                                                                                cells: singleItem.values
                                                                                    .map(
                                                                                      (value) => DataCell(
                                                                                        Text(value.toString()),
                                                                                        showEditIcon: false,
                                                                                        placeholder: false,
                                                                                      ),
                                                                                    )
                                                                                    .toList()),
                                                                          )
                                                                          .toList()),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                year == "Trend"
                                                    ? Container(
                                                        height: 200,
                                                        width:
                                                            getProportionateScreenWidth(
                                                                500),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(22.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  child: DataTable(
                                                                      columnSpacing: 0,
                                                                      columns: getBarColumns(barGraphLabels),
                                                                      rows: listConverter(bargraph)
                                                                          .map(
                                                                            (singleItem) => DataRow(
                                                                                cells: singleItem.values
                                                                                    .map(
                                                                                      (value) => DataCell(
                                                                                        Text(value.toString()),
                                                                                        showEditIcon: false,
                                                                                        placeholder: false,
                                                                                      ),
                                                                                    )
                                                                                    .toList()),
                                                                          )
                                                                          .toList()),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                snapshot.data!.length > 1
                                                    ? Divider(
                                                        height: 1,
                                                        color: Colors.black,
                                                      )
                                                    : SizedBox.shrink(),
                                              ],
                                            );
                                          } else {
                                            return Center(
                                                child: Text(
                                                    "Unsupported Chart type"));
                                          }
                                        } else {
                                          return Text("");
                                        }
                                      },
                                    ),
                                  );
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DataColumn> getColums(List<String> pieLabels) {
    return pieLabels.map((String column) {
      return DataColumn(label: Text(column));
    }).toList();
  }

  List<DataColumn> getBarColumns(List<String> barValueLabels) {
    List<DataColumn> columns = <DataColumn>[];

    barValueLabels.map((String column) {
      columns.add(DataColumn(
          label: SizedBox(
              width: 150,
              child: Text(
                column,
                overflow: TextOverflow.ellipsis,
                maxLines: 15,
                style: TextStyle(fontSize: 10),
              ))));
    }).toList();

    return columns;
  }

  List<MyGraph> listConverter(List<BarGraph2> bargraphs) {
    List<MyGraph> my = <MyGraph>[];

    bargraphs.map((BarGraph2 singlegraph) {
      MyGraph graph = my.firstWhere(
          (element) => element.type == singlegraph.type,
          orElse: () => MyGraph(null));

      if (graph.type == null) {
        graph = MyGraph(singlegraph.type);
        my.add(graph);
        graph.values.add(singlegraph.type.toString());
      }
      graph.values.add(singlegraph.value.toString());
    }).toList();
    return my;
  }
}

class MyGraph {
  String? type;
  List<String> values = [];
  MyGraph(this.type);
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

class BarGraph2 {
  String? type;
  double? value;

  BarGraph2(
    this.type,
    this.value,
  );
}

class PieChart {
  String? name;
  double? value;

  PieChart(this.name, this.value);
}
