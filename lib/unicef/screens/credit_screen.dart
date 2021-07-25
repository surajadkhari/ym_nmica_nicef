import 'package:flutter/material.dart';
import 'package:unicef/presentation/home/components/drawer.dart';
import 'package:unicef/unicef/components/credit_screen_widget.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credits"),
      ),
      body: AboutAppSimpleBlueRoute(),
      drawer: DrawerNavigation(),
    );
  }
}
