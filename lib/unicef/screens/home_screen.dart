import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:unicef/unicef/components/drawer.dart';
import 'package:unicef/unicef/components/home_screen_widget.dart';
import 'package:unicef/unicef/models/cacheInDicator.dart';
import 'package:unicef/unicef/models/chart.dart';
import 'package:unicef/unicef/services/all_indicators_service.dart';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:unicef/unicef/widgets/Progress.dart';

class HomeScreen extends StatefulWidget {
  static const screenId = "home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AllIndicatorService _allIndicatorService = AllIndicatorService();

  @override
  void initState() {
    super.initState();
  }

  cacheAllData() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext contect) {
          return Progress(
            message: "Retriving Data",
          );
        });
    cacheIndicators();
    cacheCharts();
    Navigator.pop(context);
  }

  cacheIndicators() async {
    Response response = await _allIndicatorService.getAllIndicators();
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      var jsonResponses = jsonResponse
          .map((checkBoxState) => new CachIindicator.fromJson(checkBoxState))
          .toList();

      jsonResponses.forEach((element) async {
        int? id = element.id;
        APICacheDBModel cacheDBModel = new APICacheDBModel(
            key: 'myIndicator$id', syncData: element.toString());
        await APICacheManager().addCacheData(cacheDBModel);
      });
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  cacheCharts() async {
    Response response = await _allIndicatorService.getAllCharts();
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      var jsonResponses = jsonResponse
          .map((checkBoxState) => new Chart.fromJson(checkBoxState))
          .toList();

      jsonResponses.forEach((element) async {
        int? id = element.id;
        APICacheDBModel cacheDBModel = new APICacheDBModel(
            key: 'myChart$id', syncData: element.toString());
        await APICacheManager().addCacheData(cacheDBModel);
      });
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.black,
            ),
            onPressed: () {
              cacheAllData();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),
      body: HomeScreenWidget(),
      drawer: DrawerNavigation(),
    );
  }
}
