import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicef/unicef/components/drawer.dart';
import 'package:unicef/unicef/components/home_screen_widget.dart';
import 'package:unicef/unicef/models/version.dart';
import 'package:unicef/unicef/screens/notifications.dart';
import 'package:unicef/unicef/screens/sync_screen.dart';
import 'package:unicef/unicef/services/version_service.dart';

class HomeScreen extends StatefulWidget {
  static const screenId = "home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VersionService _versionService = VersionService();

  bool isNew = false;
  checkVersion() async {
    final prefs = await SharedPreferences.getInstance();
    var result = await _versionService.getVersion();

    var jsonResponse = json.decode(result.body);
    // var data = jsonResponse.map((version) => Version.fromJson(version));
    var model = new Version();
    model.number = jsonResponse['number'];
    model.name = jsonResponse['name'];
    model.release_date = jsonResponse['release_date'];
    model.description = jsonResponse['description'];
    final version = prefs.getString("version");

    if (version != model.number) {
      setState(() {
        isNew = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkVersion();
  }

  List indicator = [];

  @override
  Widget build(BuildContext context) {
    return isNew
        ? Scaffold(
            body: AlertDialog(
              title: const Text('New Data Has been Updated!'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('NMICS database has been updated!'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Async Data'),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, SyncScreen.screenId, (route) => false);
                  },
                ),
              ],
            ),
          )
        : Scaffold(
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
                // IconButton(
                //   icon: Icon(
                //     Icons.refresh,
                //     color: Colors.black,
                //   ),
                //   onPressed: () {
                //     cacheAllData();
                //   },
                // ),
                IconButton(
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
                // IconButton(
                //   icon: Icon(
                //     Icons.logout,
                //     color: Colors.black,
                //   ),
                //   onPressed: () {
                //     final FirebaseAuth auth = FirebaseAuth.instance;
                //     auth.signOut();
                //     Navigator.pushNamedAndRemoveUntil(
                //         context, LoginScreen.screenId, (route) => false);
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(
                //         content: Text("See you next time!"),
                //       ),
                //     );
                //   },
                // ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, SyncScreen.screenId, (route) => false);
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.grey,
                  ),
                )
                //     ],
              ],
            ),
            body: HomeScreenWidget(),
            drawer: DrawerNavigation(),
          );
  }
}
