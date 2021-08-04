import 'package:flutter/material.dart';

import 'package:unicef/unicef/components/chart_screen_widget.dart';
import 'package:unicef/unicef/components/drawer.dart';

// ignore: must_be_immutable
class ChartScreen extends StatelessWidget {
  static const screenId = "chart";
  String name;

  List<int> ids;
  ChartScreen({
    Key? key,
    required this.ids,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ChartScreenWidget(
        ids: ids,
        name: name,
      ),
      drawer: DrawerNavigation(),
    );
  }
}
