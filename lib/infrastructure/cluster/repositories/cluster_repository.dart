import 'package:unicef/common/platform/connectivity.dart';
import 'package:unicef/domain/cluster/i_cluster_repository.dart';
import 'package:unicef/infrastructure/cluster/data_sources/cluster_local_data_provider.dart';
import 'package:unicef/infrastructure/cluster/data_sources/cluster_remote_data_provider.dart';
import 'package:unicef/infrastructure/cluster/entities/cluster.dart';

class ClusterRepository implements IClusterRepository {
  ClusterRepository(
    this.clutserLocalDataProvider,
    this.clutserRemoteDataProvider, {
    required this.connectivity,
  });

  final Connectivity connectivity;
  final ClusterLocalDataProvider clutserLocalDataProvider;
  final ClusterRemoteDataProvider clutserRemoteDataProvider;

  @override
  Future<List<Cluster>> fetchClusters() async {
    if (connectivity.isConnected) {
      final clusters = await clutserRemoteDataProvider.fetchClusters();
      clutserLocalDataProvider.cacheClusters(clusters);
      print(clusters);
      return clusters;
    } else {
      final clusters = await clutserLocalDataProvider.fetchClusters();
      clutserLocalDataProvider.cacheClusters(clusters!);

      return clusters;
    }
  }

  @override
  Future<Cluster> getCluster(String id) async {
    if (connectivity.isConnected) {
      final Cluster? cluster = await clutserRemoteDataProvider.getCluster(id);
      clutserLocalDataProvider.cacheCluster(cluster!);
      return cluster;
    } else {
      final Cluster? cluster = await clutserLocalDataProvider.getCluster(id);
      return cluster!;
    }
  }
}
