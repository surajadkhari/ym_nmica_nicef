import 'package:flutter/material.dart';

class AboutAppSimpleBlueRoute extends StatefulWidget {
  AboutAppSimpleBlueRoute();

  @override
  AboutAppSimpleBlueRouteState createState() =>
      new AboutAppSimpleBlueRouteState();
}

class AboutAppSimpleBlueRouteState extends State<AboutAppSimpleBlueRoute> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Project Credit", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        // height: double.infinity,r
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Young Minds Creations",
                style: TextStyle(color: Colors.black, fontSize: 20)),
            Container(height: 5),
            Container(width: 120, height: 3, color: Colors.white),
            Container(height: 15),
            Text("App Version :1.0.0", style: TextStyle(color: Colors.black)),
            Container(height: 15),
            Text(
              "We are a multinational software development, web design and branding, advertising and IT System and Software Consultancy provider. We provide Strategic thinking, top developers and designers, personal attention, real world results, competitive prices. Our experience in providing successful software and web development and ecommerce services and maintenance of sophisticated internet applications for different industries helps us create solutions working trouble free from the outset. Young Minds Nepal guarantees quality, competent and rapid execution of any projects – from small websites to complex ecommerce software and custom solution programming",
              style: TextStyle(color: Colors.black),
            ),
            Container(height: 15),
            Text(
              "Address: Young Minds Tower, Prayag Chowk, Shanti Nagar, Kathmandu, Nepal",
              style: TextStyle(color: Colors.black),
            ),
            Container(height: 15),
            Text(
              "Phone: (977) 1 4115132",
              style: TextStyle(color: Colors.black),
            ),
            Container(height: 15),
            Text(
              "Email:info@youngminds.com.np",
              style: TextStyle(color: Colors.black),
            ),
            Container(height: 15),
            Text(
              "Website:https://www.youngminds.com.np",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
