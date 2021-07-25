import 'package:flutter/material.dart';

class NotificationScreenWidget extends StatefulWidget {
  const NotificationScreenWidget({Key? key}) : super(key: key);

  @override
  _NotificationScreenWidgetState createState() =>
      _NotificationScreenWidgetState();
}

class _NotificationScreenWidgetState extends State<NotificationScreenWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Text("On"),
      ),
    );
  }
}
