import 'package:flutter/material.dart';
import 'package:unicef/presentation/splash/splash_screen.dart';
import 'package:unicef/common/utils/theme.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NMICS',
      theme: theme(),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
