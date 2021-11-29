import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:unicef/unicef/screens/map_screen.dart';
import 'package:unicef/unicef/services/infomation_service.dart';

// ignore: must_be_immutable
class IntroductionScreen extends StatefulWidget {
  static const screenId = "introduction";
  var title;
  var information;

  IntroductionScreen({Key? key, this.title, this.information})
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Introduction",
          style: TextStyle(color: Colors.blue),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: 800,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Html(data: widget.information),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0.0,
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
