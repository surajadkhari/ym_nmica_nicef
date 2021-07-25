import 'package:flutter/material.dart';
import 'package:unicef/presentation/home/components/drawer.dart';
import 'package:unicef/unicef/components/infomation_screen_widget.dart';

class InfomationScreen extends StatelessWidget {
  final String information;
  final String title;
  const InfomationScreen(
      {Key? key, required this.information, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: InfomationScreenWidget(
        information: information,
      ),
      drawer: DrawerNavigation(),
    );
  }
}
