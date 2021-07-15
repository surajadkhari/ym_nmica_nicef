import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

import 'package:unicef/unicef/models/chart.dart';
import 'package:unicef/unicef/services/chart_service.dart';
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
  String? charts;

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
  List<Series<LineChart, num>> _seriesLineData = [];
  ChartService _chartService = ChartService();
  Future<List<Chart>>? futureChart;
  @override
  void initState() {
    super.initState();
    futureChart = _chartService.fetchCharts(this.widget.ids!);
    // ignore: deprecated_member_use
    _seriesLineData = <charts.Series<LineChart, num>>[];
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
          Expanded(
            child: FutureBuilder<List<Chart>>(
              future: futureChart,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // List<Chart>? data = snapshot.data;
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(
                          ".....................................................");

                      print(snapshot.data![index].charts.keys.elementAt(index));
                      if (snapshot.data![index].chartType.toString() ==
                          "ChartType.LINE_GRAPH") {
                        List<LineChart> data = [];
                        data.add(LineChart(snapshot.data![index].name, 1));
                        _seriesLineData.add(
                          charts.Series(
                            colorFn: (__, _) =>
                                charts.ColorUtil.fromDartColor(Colors.black),
                            id: '1',
                            data: data,
                            domainFn: (LineChart lineChart, _) =>
                                lineChart.value!,
                            measureFn: (LineChart lineChart, _) =>
                                lineChart.value,
                          ),
                        );
                        return Text(snapshot.data![index].chartType.toString());
                      } else {
                        return Text("hello");
                      }
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LineChart {
  String? type;
  num? value;

  LineChart(
    this.type,
    this.value,
  );
}
