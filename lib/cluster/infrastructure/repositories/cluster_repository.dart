import 'package:unicef/cluster/domain/entities/cluster.dart';
import 'package:unicef/cluster/domain/interfaces/clutser_interface.dart';
import 'package:unicef/cluster/infrastructure/data_sources/cluster_local_data_provider.dart';
import 'package:unicef/cluster/infrastructure/data_sources/cluster_remote_data_provider.dart';
import 'package:unicef/cluster/infrastructure/models/cluster_model.dart';
import 'package:unicef/common/exceptions/exceptions.dart';
import 'package:unicef/common/platform/connectivity.dart';

class ClusterRepository implements ClusterInterface {
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
    if (true) {
      final List<ClusterModel>? clusters =
          (await clutserRemoteDataProvider.fetchClusters())
              .cast<ClusterModel>();
      clutserLocalDataProvider.cacheClusters(clusters!);
      print(clusters);
      return clusters;
    }
  }

  @override
  Future<Cluster> getCluster(String? id) async {
    if (connectivity.isConnected) {
      try {
        final ClusterModel? cluster =
            await clutserRemoteDataProvider.getCluster(id!);
        clutserLocalDataProvider.cacheCluster(cluster!);
        return cluster;
      } catch (e) {
        print(e);
        return ServerException()();
      }
    } else {
      ClusterModel? cluster = await clutserLocalDataProvider.getCluster(id!);
      return cluster!;
    }
  }
}
