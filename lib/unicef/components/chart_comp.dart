import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unicef/unicef/models/chart.dart';
import 'package:unicef/unicef/services/chart_facade_service.dart';

class ChartComp extends StatefulWidget {
  List<int>? ids;
  int? id;
  int? indicatorClusterId;
  String? indicatorCode;
  String? name;
  String? description;
  String? module;
  List? charts;

  ChartComp({
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
  _ChartCompState createState() => _ChartCompState();
}

class _ChartCompState extends State<ChartComp> {
  ChartFacadeService _chartFacadeService = ChartFacadeService();
  Future<List<Chart>>? loadedChart;
  @override
  void initState() {
    _getKeyValue();
    // _chartFacadeService.fetchCharts(this.widget.ids!);
    //print(loadedChart);
    super.initState();
  }

  _getKeyValue() async {
    var chart = await _chartFacadeService.fetchCharts(this.widget.ids!);
    var result = json.decode(chart.body) as Map;
    var getKey = result['charts'];

    for (final key in getKey) {
      final value = result['charts'];
      print("$key, $value");
    }

    // result['charts'].forEach((data) {
    //   var chartModel = Chart();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Chart Screen'),
      ),
    );
  }
}
