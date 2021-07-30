import 'package:flutter/material.dart';
import 'package:unicef/presentation/home/components/drawer.dart';
import 'package:unicef/unicef/components/notification_screen_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: NotificationScreenWidget(),
      ),
      drawer: DrawerNavigation(),
    );
  }
}
