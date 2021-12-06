import 'package:flutter/material.dart';

import 'package:unicef/unicef/components/drawer.dart';
import 'package:unicef/unicef/components/indicator_widget_screen.dart';
import 'package:unicef/unicef/screens/notifications.dart';

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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => NotificationScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: IndicatorScreenWidget(
        id: id,
        name: name,
      ),
      drawer: DrawerNavigation(),
    );
  }
}
