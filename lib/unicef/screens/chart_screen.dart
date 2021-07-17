import 'package:flutter/material.dart';
import 'package:unicef/unicef/components/chart_comp.dart';

import 'package:unicef/unicef/components/chart_screen_widget.dart';
import 'package:unicef/unicef/components/drawer.dart';

// ignore: must_be_immutable
class ChartScreen extends StatelessWidget {
  static const screenId = "chart";

  List<int> ids;
  ChartScreen({
    Key? key,
    required this.ids,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Indicators'),
      ),
      body: ChartScreenWidget(
        ids: ids,
      ),
      drawer: DrawerNavigation(),
    );
  }
}
