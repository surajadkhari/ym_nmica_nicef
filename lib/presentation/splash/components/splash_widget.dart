import 'dart:async';
import 'package:flutter/material.dart';
import 'package:unicef/presentation/auth/login/login_screen.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
    _displaySplash();
  }

  // ignore: always_declare_return_types
  _displaySplash() {
    Timer(const Duration(seconds: 5), () {
      final Route route = MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen());
      Navigator.pushReplacement(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Image.asset('assets/images/splash_main.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/gov_logo.png',
                          height: 100.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text(
                            "Government of Nepal",
                            style:
                                TextStyle(fontSize: 10.0, color: Colors.grey),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text(
                            "Central Bureau of Statistics ",
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/unicef_logo.png',
                          height: 90.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text(
                            "UNICEF",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Image.asset(
                    'assets/images/mic_logo.png',
                    width: 150.0,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Nepal Multiple Indicator Cluster",
                    style: TextStyle(fontSize: 18.0, color: Colors.grey),
                  ),
                ),
              ],
            ),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "NMICS v1.0 2021",
                    style: TextStyle(color: Colors.grey, fontSize: 10.0),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}