import 'dart:convert';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:unicef/unicef/components/card_componet.dart';
import 'package:unicef/unicef/components/search.dart';
import 'package:unicef/unicef/models/clusters.dart';
import 'package:unicef/unicef/screens/indicator_screen.dart';
import 'package:unicef/unicef/screens/notifications.dart';
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
  @override
  void initState() {
    super.initState();
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
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }

      NoificationService.display(message);
    });

    getAllClusters();

    FirebaseMessaging.onMessageOpenedApp.listen(
      (event) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NotificationScreen(),
          ),
        );
      },
    );
  }

  var _clusterList = [];

  getAllClusters() async {
    var isCacheExist =
        await APICacheManager().isAPICacheKeyExist('clusters_list');
    if (!isCacheExist) {
      var clusters = await _clusterService.getClusters();
      var result = json.decode(clusters.body);
      APICacheDBModel cacheDBModel =
          new APICacheDBModel(key: "clusters_list", syncData: clusters.body);
      await APICacheManager().addCacheData(cacheDBModel);
      result.forEach((data) {
        var model = Cluster();
        model.id = data['id'];
        model.name = data['name'];
        setState(() {
          _clusterList.add(model);
        });
      });
    } else {
      var cachedData = await APICacheManager().getCacheData('clusters_list');
      var result = json.decode(cachedData.syncData);
      result.forEach((data) {
        var model = Cluster();
        model.id = data['id'];
        model.name = data['name'];
        setState(() {
          _clusterList.add(model);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchWidget(),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Choose Indicator"),
          ),
          const SizedBox(height: 2),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (_, index) {
                if (_clusterList.isNotEmpty) {
                  return CardComponent(
                      title: _clusterList[index].name,
                      press: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => IndicatorScreen(
                              name: _clusterList[index].name,
                              id: _clusterList[index].id,
                            ),
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
          ),
        ],
      ),
    );
  }
}
