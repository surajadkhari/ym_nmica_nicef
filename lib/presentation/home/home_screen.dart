import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicef/application/cluster_list/cluster_list_bloc.dart';
import 'package:unicef/presentation/home/components/drawer.dart';
import 'package:unicef/presentation/home/components/home_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: MultiBlocProvider(
      providers: [
        BlocProvider<ClusterListBloc>(
          create: (context) => getIt<ClusterListBloc>(),
        )
      ],
      drawer: DrawerNavigation(),
    );
  }
}
