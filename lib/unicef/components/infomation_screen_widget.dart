import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class InfomationScreenWidget extends StatefulWidget {
  final String information;
  const InfomationScreenWidget({Key? key, required this.information})
      : super(key: key);

  @override
  _InfomationScreenWidgetState createState() => _InfomationScreenWidgetState();
}

class _InfomationScreenWidgetState extends State<InfomationScreenWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Html(
            data: this.widget.information,
          ),
        ),
      ),
    );
  }
}
