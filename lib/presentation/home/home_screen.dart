import 'package:flutter/material.dart';

import 'components/drawer.dart';
import 'components/home_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const HomeScreenWidget(),
      drawer: const DrawerNavigation(),
    );
  }
}
