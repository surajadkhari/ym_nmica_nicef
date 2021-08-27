import 'package:flutter/material.dart';
import 'package:unicef/unicef/components/credit_screen_widget.dart';
import 'package:unicef/unicef/components/drawer.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AboutAppSimpleBlueRoute(),
      drawer: DrawerNavigation(),
    );
  }
}
