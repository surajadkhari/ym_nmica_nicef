import 'package:flutter/material.dart';

class AboutAppSimpleBlueRoute extends StatefulWidget {
  final information;
  final String title;
  AboutAppSimpleBlueRoute({required this.information, required this.title});

  @override
  AboutAppSimpleBlueRouteState createState() =>
      new AboutAppSimpleBlueRouteState();
}

class AboutAppSimpleBlueRouteState extends State<AboutAppSimpleBlueRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        // height: double.infinity,r
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text(widget.information['title'],
            //     style: TextStyle(color: Colors.black, fontSize: 20)),
            Container(height: 15),
            Text(
              widget.information['description'],
              style: TextStyle(color: Colors.black),
            ),
            // Text("App Version : 1.0.0", style: TextStyle(color: Colors.black)),

           
          ],
        ),
      ),
    );
  }
}
