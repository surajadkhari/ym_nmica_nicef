import 'package:flutter/material.dart';

import 'package:unicef/unicef/components/drawer.dart';
import 'package:unicef/unicef/components/indicator_widget_screen.dart';

// ignore: must_be_immutable
class IndicatorScreen extends StatelessWidget {
  static const screenId = "indicator";
  int id;
  String name;

  IndicatorScreen({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/mic_logo.png',
              fit: BoxFit.contain,
              height: 20,
            ),
          ],
        ),
      ),
      body: IndicatorScreenWidget(
        id: id,
        name: name,
      ),
      drawer: DrawerNavigation(),
    );
  }
}
