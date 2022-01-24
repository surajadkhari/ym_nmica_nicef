import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:open_settings/open_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicef/unicef/models/version.dart';
import 'package:unicef/unicef/repository/repository.dart';
import 'package:unicef/unicef/screens/home_screen.dart';
import 'package:unicef/unicef/services/chart2_service.dart';
import 'package:unicef/unicef/services/cluster_service.dart';
import 'package:unicef/unicef/services/credit_service.dart';
import 'package:unicef/unicef/services/indicator_services.dart';
import 'package:unicef/unicef/services/infomation_service.dart';
import 'package:unicef/unicef/services/version_service.dart';
import 'package:unicef/unicef/widgets/Progress.dart';

class SyncScreenWidget extends StatefulWidget {
  const SyncScreenWidget({Key? key}) : super(key: key);

  @override
  _SyncScreenWidgetState createState() => _SyncScreenWidgetState();
}

class _SyncScreenWidgetState extends State<SyncScreenWidget> {
  IndicatorServices _indicatorServices = IndicatorServices();
  ClusterService _clusterService = ClusterService();
  InfomationService _infomationService = InfomationService();
  VersionService _versionService = VersionService();
  Chart2Service _chartService = Chart2Service();
  CreditService _creditService = CreditService();
  var version;
  var name;
  var description;
  var releaseDate;

  Repository _repository = Repository();
  @override
  void initState() {
    super.initState();
    checkVersion();
  }

  checkVersion() async {
    final prefs = await SharedPreferences.getInstance();

    var result = await _versionService.getVersion();

    var jsonResponse = json.decode(result.body);
    // var data = jsonResponse.map((version) => Version.fromJson(version));
    var model = new Version();
    model.number = jsonResponse['number'];
    model.name = jsonResponse['name'];
    model.release_date = jsonResponse['release_date'];
    model.description = jsonResponse['description'];
    setState(() {
      name = model.name;
      description = model.description;
      version = model.number;
      releaseDate = model.release_date;
    });
    await prefs.setString('version', model.number!);
  }

  cacheAllData() async {
    var connection = await Connectivity().checkConnectivity();
    if (connection == ConnectivityResult.none) {
      final snackBar = SnackBar(
        content: Text('Turn on your internet connection!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      await Future.delayed(const Duration(seconds: 2), () {
        OpenSettings.openWIFISetting();
      });
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext contect) {
            return Progress(
              message: "Retrieving Data",
            );
          });
      _repository.deleteAllData();
      _chartService.saveChartHive();
      _infomationService.saveDescriptions();
      _clusterService.saveClusters();
      _indicatorServices.saveIndicators();
      _chartService.cacheData();
      _chartService.saveCharts();
      _infomationService.saveIntroduction();
      _infomationService.saveSurvey();
      _infomationService.saveDemography();
      _infomationService.saveTerms();
      _infomationService.savePolicy();
      _creditService.saveCredits();
      checkVersion();
      await Future.delayed(const Duration(seconds: 5), () {});
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.screenId, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sync New data", style: TextStyle(color: Colors.blue)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.screenId, (route) => false);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Version: $version"),
                Text("Version Name: $name"),
                Text("Version Description: $description"),
                Text("Version release date: $releaseDate"),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    cacheAllData();
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.blue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(5, 5),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Sync New Data',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
