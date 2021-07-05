import 'package:unicef/cluster/domain/entities/cluster.dart';
import 'package:unicef/cluster/domain/interfaces/clutser_interface.dart';
import 'package:unicef/cluster/infrastructure/data_sources/cluster_local_data_provider.dart';
import 'package:unicef/cluster/infrastructure/data_sources/cluster_remote_data_provider.dart';
import 'package:unicef/cluster/infrastructure/models/cluster_model.dart';
import 'package:unicef/common/exceptions/exceptions.dart';
import 'package:unicef/common/platform/connectivity.dart';

class ClusterRepository implements ClusterInterface {
  var productLocalDataProvider;

  var productRemoteDataProvider;

  ClusterRepository(
    this.clutserLocalDataProvider,
    this.clutserRemoteDataProvider, {
    required this.connectivity,
    required this.productLocalDataProvider,
    required this.productRemoteDataProvider,
  });

  final Connectivity connectivity;
  final ClusterLocalDataProvider clutserLocalDataProvider;
  final ClusterRemoteDataProvider clutserRemoteDataProvider;

  @override
  Future<List<Cluster>> fetchClusters() async {
    if (connectivity.isConnected) {
      try {
        final List<ClusterModel>? clusters =
            await clutserRemoteDataProvider.fetchCluster();
        clutserLocalDataProvider.cacheCluster(null);
        return clusters!;
      } catch (e) {
        print(e);
      }
    } else {
      return clutserLocalDataProvider.fetchCluster();
    }
  }

  @override
  Future<Cluster> getCluster(String id) async {
    if (connectivity.isConnected) {
      try {
        final Clutser product = await clutserRemoteDataProvider.getProduct(id);
        // cache product
        clutserLocalDataProvider.cacheProduct(product);
        return product;
      } catch (e) {
        print(e);
        return ServerException()();
      }
    } else {
      return productLocalDataProvider.getProduct(id);
    }
  }
}
