import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:unicef/unicef/screens/map_screen.dart';
import 'package:unicef/unicef/services/infomation_service.dart';

// ignore: must_be_immutable
class IntroductionScreen extends StatefulWidget {
  static const screenId = "introduction";
  var title;
  var information;

  IntroductionScreen({Key? key, required this.title, required this.information})
      : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  InfomationService _informationService = InfomationService();
  String? data;

  @override
  void initState() {
    super.initState();
    getIntroduction();
  }

  getIntroduction() async {
    data = await _informationService.getIntroduction();
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Html(data: widget.information),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, MapScreen.screenId, (route) => false);
              },
              child: const Text('Select your preference',
                  style: TextStyle(fontSize: 20)),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 5,
            ),
          ),
        ],
      ),
    );
  }
}