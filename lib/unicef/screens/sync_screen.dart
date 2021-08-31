import 'package:flutter/material.dart';
import 'package:unicef/unicef/components/drawer.dart';
import 'package:unicef/unicef/components/sync_widget_scree.dart';

class SyncScreen extends StatelessWidget {
  static const screenId = "sync";

  const SyncScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SyncScreenWidget(),
      drawer: DrawerNavigation(),
    );
  }
}
