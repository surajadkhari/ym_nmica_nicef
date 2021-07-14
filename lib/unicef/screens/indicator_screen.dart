import 'package:flutter/material.dart';

import 'package:unicef/unicef/components/drawer.dart';
import 'package:unicef/unicef/components/indicator_widget_screen.dart';

// ignore: must_be_immutable
class IndicatorScreen extends StatelessWidget {
  String name;
  int id;
  IndicatorScreen({
    Key? key,
    required this.name,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Indicators'),
      ),
      body: IndicatorScreenWidget(
        id: id,
        name: name,
      ),
      drawer: DrawerNavigation(),
    );
  }
}
