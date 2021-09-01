import 'package:flutter/material.dart';
import 'package:unicef/unicef/components/credit_screen_widget.dart';
import 'package:unicef/unicef/components/drawer.dart';

class CreditScreen extends StatelessWidget {
  final information;
  final String title;
  const CreditScreen({
    Key? key,
    required this.information,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AboutAppSimpleBlueRoute(
        information: information,
        title: title,
      ),
      drawer: DrawerNavigation(),
    );
  }
}
