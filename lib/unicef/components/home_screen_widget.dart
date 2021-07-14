import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:unicef/unicef/components/card_componet.dart';
import 'package:unicef/unicef/components/search.dart';
import 'package:unicef/unicef/models/clusters.dart';
import 'package:unicef/unicef/screens/indicator_screen.dart';

import 'package:unicef/unicef/services/cluster_service.dart';

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
    getAllClusters();
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
          const SearchComponent(),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Choose Indicator"),
          ),
          const SizedBox(height: 2),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (_, index) => CardComponent(
                  title: _clusterList[index].name,
                  press: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => IndicatorScreen(
                            name: _clusterList[index].name,
                            id: _clusterList[index].id,
                          ),
                        ));
                  },
                  id: _clusterList[index].id),
              itemCount: _clusterList.length,
            ),
          )
        ],
      ),
    );
  }
}