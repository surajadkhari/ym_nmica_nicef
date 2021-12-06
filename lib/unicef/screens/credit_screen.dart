import 'package:flutter/material.dart';
import 'package:unicef/unicef/components/credit_screen_widget.dart';
import 'package:unicef/unicef/components/drawer.dart';
import 'package:unicef/unicef/screens/notifications.dart';

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
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.blue),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
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
      body: AboutAppSimpleBlueRoute(
        information: information,
        title: title,
      ),
      drawer: DrawerNavigation(),
    );
  }
}
