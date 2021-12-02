import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicef/unicef/models/version.dart';
import 'package:unicef/unicef/services/chart2_service.dart';
import 'package:unicef/unicef/services/chart_service.dart';
import 'package:unicef/unicef/services/cluster_service.dart';
import 'package:unicef/unicef/services/credit_service.dart';
import 'package:unicef/unicef/services/indicator_services.dart';
import 'package:unicef/unicef/services/infomation_service.dart';
import 'package:open_settings/open_settings.dart';
import 'package:unicef/unicef/services/version_service.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  ClusterService _clusterService = ClusterService();
  IndicatorServices _indicatorServices = IndicatorServices();
  InfomationService _infomationService = InfomationService();
  CreditService _creditService = CreditService();
  Chart2Service _chartService = Chart2Service();
  VersionService _versionService = VersionService();
  Future? v;

  Future<bool> _getBoolFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final isCached = prefs.getBool('isCached');
    if (isCached == null) {
      return false;
    }
    return true;
  }

  Future<void> checkIsCached() async {
    var connection = await Connectivity().checkConnectivity();

    final prefs = await SharedPreferences.getInstance();

    bool isCached = await _getBoolFromSharedPref();
    // bool isCached = false;

    if (!isCached) {
      if (connection == ConnectivityResult.none) {
        final snackBar = SnackBar(
          content: Text('Turn on your internet connection!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        await Future.delayed(const Duration(seconds: 2), () {
          OpenSettings.openWIFISetting();
          exit(0);
        });
      } else {
        _clusterService.saveClusters();
        _indicatorServices.saveIndicators();
        _chartService.cacheData();
        _infomationService.saveIntroduction();
        _infomationService.saveDescriptions();
        _infomationService.saveSurvey();
        _infomationService.saveDemography();
        _infomationService.saveTerms();
        _infomationService.savePolicy();
        _creditService.saveCredits();

        await prefs.setBool('isCached', true);
        checkVersion();
      }
    }

    // } else {
    //   checkVersion();

    //   _repository.deleteAllData();
    //   _clusterService.saveClusters();
    //   _indicatorServices.saveIndicators();
    //   // _chartService.saveCharts();
    //   _infomationService.saveIntroduction();
    //   _infomationService.saveSurvey();
    //   _infomationService.saveDemography();
    //   _infomationService.saveTerms();
    //   _infomationService.savePolicy();
    //   print("Hello");
    //   await prefs.setBool('isCached', true);
    // }
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
    await prefs.setString('version', model.number!);
  }

  @override
  void initState() {
    super.initState();
    v = _versionService.getVersion();

    checkIsCached();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Image.asset('assets/images/splash_main.png'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/gov_logo.png',
                            height: 100.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              "Government of Nepal",
                              style:
                                  TextStyle(fontSize: 10.0, color: Colors.grey),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "Central Bureau of Statistics ",
                              style:
                                  TextStyle(fontSize: 13.0, color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/unicef_logo.png',
                            height: 90.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              "UNICEF",
                              style:
                                  TextStyle(fontSize: 18.0, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset(
                      'assets/images/mic_logo.png',
                      width: 150.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Nepal Multiple Indicator Cluster",
                      style: TextStyle(fontSize: 18.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "NMICS v1.0 2021",
                      style: TextStyle(color: Colors.grey, fontSize: 10.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
