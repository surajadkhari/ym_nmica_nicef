import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:unicef/unicef/models/introduction.dart';
import 'package:unicef/unicef/screens/map_screen.dart';
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
  // getDescriptions() async {
  //   descriptions = await _informationService.getDescriptions();
  //   print(descriptions);
  // }

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
      print(descriptionsList);
    });
  }

  @override
  @override
  void initState() {
    super.initState();
    getDescriptions();
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
          ListView.builder(
              itemCount: descriptionsList.length,
              itemBuilder: (context, index) {
                return ExpansionTileCard(
                  leading: CircleAvatar(
                    child: Text(descriptionsList[index].title![0]),
                    backgroundColor: HexColor(descriptionsList[index].color!),
                  ),
                  title: Text(descriptionsList[index].title!),
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
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
    );
  }
}
