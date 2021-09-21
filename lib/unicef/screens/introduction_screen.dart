import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:unicef/unicef/screens/home_screen.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            widget.title.toString(),
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Html(data: widget.information),
            )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0.0,
                child: Container(
                  height: 100.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: MaterialButton(
                            color: Colors.blue,
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  HomeScreen.screenId, (route) => false);
                            },
                            child: Text(
                              '               HOME              ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
