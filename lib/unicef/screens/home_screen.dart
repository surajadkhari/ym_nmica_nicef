import 'package:flutter/material.dart';
import 'package:unicef/infrastructure/cluster/entities/cluster.dart';
import 'package:unicef/unicef/components/drawer.dart';
import 'package:unicef/unicef/components/home_screen_widget.dart';
import 'package:unicef/unicef/screens/notifications.dart';
import 'package:unicef/unicef/services/chart_service.dart';
import 'package:unicef/unicef/services/cluster_service.dart';
import 'package:unicef/unicef/services/indicator_services.dart';
import 'package:unicef/unicef/services/infomation_service.dart';

import 'package:unicef/unicef/widgets/Progress.dart';

class HomeScreen extends StatefulWidget {
  static const screenId = "home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IndicatorServices _indicatorServices = IndicatorServices();
  ClusterService _clusterService = ClusterService();
  ChartService _chartService = ChartService();
  InfomationService _infomationService = InfomationService();
  @override
  void initState() {
    super.initState();
  }

  List indicator = [];
  cacheAllData() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext contect) {
          return Progress(
            message: "Retriving Data",
          );
        });
    _clusterService.saveClusters();
    _indicatorServices.saveIndicators();
    _chartService.saveCharts();
    _infomationService.saveIntroduction();

    _infomationService.saveSurvey();
    _infomationService.saveDemography();
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/mic_logo.png',
              fit: BoxFit.contain,
              height: 20,
            ),
          ],
        ),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => NotificationScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: HomeScreenWidget(),
      drawer: DrawerNavigation(),
    );
  }
}
