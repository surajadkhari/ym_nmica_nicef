import 'package:flutter/material.dart';
import 'package:unicef/cluster/infrastructure/data_sources/cluster_local_data_provider.dart';
import 'package:unicef/cluster/infrastructure/data_sources/cluster_remote_data_provider.dart';
import 'package:unicef/cluster/infrastructure/repositories/cluster_repository.dart';
import 'package:unicef/common/platform/connectivity.dart';

import 'search.dart';

class HomeScreenWidget extends StatefulWidget {
  final String? id;

  const HomeScreenWidget({Key? key, this.id}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  final ClusterRepository _clusterRepository = ClusterRepository(
      clutserLocalDataProvider, clutserRemoteDataProvider,
      connectivity: connectivity);

  static ClusterLocalDataProvider clutserLocalDataProvider =
      ClusterLocalDataProvider();

  static ClusterRemoteDataProvider clutserRemoteDataProvider =
      ClusterRemoteDataProvider();

  static Connectivity connectivity = Connectivity();
  @override
  void initState() {
    super.initState();
    _clusterRepository.fetchClusters();
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
