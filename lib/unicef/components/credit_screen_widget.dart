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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        // height: double.infinity,r
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.information['title'],
                style: TextStyle(color: Colors.black, fontSize: 20)),
            Container(height: 5),
            Container(width: 120, height: 3, color: Colors.white),
            Container(height: 15),
            Text("App Version :1.0.0", style: TextStyle(color: Colors.black)),
            Container(height: 15),
            Text(
              widget.information['description'],
              style: TextStyle(color: Colors.black),
            ),
            Container(height: 15),
            Text(
              "Address:${widget.information['address']}",
              style: TextStyle(color: Colors.black),
            ),
            Container(height: 15),
            Text(
              "Phone:${widget.information['phone_number']}",
              style: TextStyle(color: Colors.black),
            ),
            Container(height: 15),
            Text(
              "Email:${widget.information['email']}",
              style: TextStyle(color: Colors.black),
            ),
            Container(height: 15),
            Text(
              "Website:${widget.information['website']}",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
