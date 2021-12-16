import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:unicef/unicef/components/card_componet.dart';
import 'package:unicef/unicef/components/search.dart';
import 'package:unicef/unicef/models/clusters.dart';
import 'package:unicef/unicef/screens/indicator_screen.dart';
import 'package:unicef/unicef/screens/notifications.dart';
import 'package:unicef/unicef/services/chart2_service.dart';
import 'package:unicef/unicef/services/cluster_service.dart';

import 'package:unicef/unicef/services/notification_service.dart';

class HomeScreenWidget extends StatefulWidget {
  final String? id;

  const HomeScreenWidget({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  ClusterService _clusterService = ClusterService();
  Chart2Service _chart2service = Chart2Service();
  Future? v;

  @override
  void initState() {
    super.initState();

    getClusters();

    NoificationService.initialize(context);
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NotificationScreen(),
          ),
        );
      }
    });

    ///forground work
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {}

      NoificationService.display(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen(
      (event) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NotificationScreen(),
          ),
        );
      },
    );
    // _chart2service.cacheData();
  }

  List<Cluster> _clusterList = [];

  getClusters() async {
    var clusters = await _clusterService.getClusters();

    clusters.forEach((data) {
      var model = Cluster();
      model.id = data['id'];
      model.name = data['name'];
      model.image = data['image'];
      model.color = data['color'];
      setState(() {
        _clusterList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SearchWidget(),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Choose Cluster",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 2),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (_, index) {
                if (_clusterList.isNotEmpty) {
                  return CardComponent(
                      color: _clusterList[index].color,
                      image: _clusterList[index].image,
                      title: _clusterList[index].name ?? 'nothing',
                      press: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => IndicatorScreen(
                                id: _clusterList[index].id!,
                                name: _clusterList[index].name!),
                          ),
                        );
                      },
                      id: _clusterList[index].id);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              itemCount: _clusterList.length,
            ),
          )
        ],
      ),
      extendBody: true,
    );
  }
}
