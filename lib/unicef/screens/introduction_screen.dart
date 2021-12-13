import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicef/unicef/components/drawer.dart';
import 'package:unicef/unicef/models/introduction.dart';
import 'package:unicef/unicef/screens/map_screen.dart';
import 'package:unicef/unicef/screens/notifications.dart';
import 'package:unicef/unicef/services/infomation_service.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class IntroductionScreen extends StatefulWidget {
  static const screenId = "introduction";

  IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  InfomationService _informationService = InfomationService();

  List<Introduction> descriptionsList = [];

  getDescriptions() async {
    var descriptions = await _informationService.getDescriptions();

    descriptions.forEach((data) {
      var model = Introduction();
      model.id = data['id'];
      model.title = data['title'];
      model.description = data['description'];
      model.color = data['color'];
      setState(() {
        descriptionsList.add(model);
      });
    });
  }

  cache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', "Nepal");
  }

  @override
  @override
  void initState() {
    super.initState();
    getDescriptions();
    cache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
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
      body: Stack(
        children: [
          ListView.builder(
              itemCount: descriptionsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTileCard(
                    baseColor: HexColor(descriptionsList[index].color!),
                    expandedColor: Colors.purple,
                    title: Text(
                      descriptionsList[index].title!,
                      style: TextStyle(color: Colors.white),
                    ),
                    children: <Widget>[
                      Divider(
                        thickness: 1.0,
                        height: 10.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            descriptionsList[index].description!,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, MapScreen.screenId, (route) => false);
                },
                child: Text('Select your preference',
                    style: TextStyle(fontSize: 20)),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 10,
              ),
            ),
          ),
        ],
      ),
      drawer: DrawerNavigation(),
    );
  }
}
