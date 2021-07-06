import 'package:flutter/material.dart';
import 'package:unicef/cluster/infrastructure/repositories/cluster_repository.dart';

import 'search.dart';

class HomeScreenWidget extends StatefulWidget {
  final String? id;

  const HomeScreenWidget({Key? key, this.id}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  ClusterRepository? clusterRepository;

  @override
  void initState() {
    super.initState();
    clusterRepository!.fetchClusters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchComponent(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Choose Indicator"),
          ),
          SizedBox(height: 2),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
