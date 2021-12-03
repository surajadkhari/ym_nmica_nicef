import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicef/unicef/components/custom_map.dart';
import 'package:unicef/unicef/screens/home_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);
  static const screenId = "map_screen";

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String dropdownvalue = 'Nepal';

  var items = [
    'Nepal',
    'Province 1',
    'Province 2',
    'Bagmati',
    'Gandaki',
    'Lumbini',
    'Karnali',
    'Sudurpashchim',
  ];

  cache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', "Nepal");
  }

  @override
  void initState() {
    super.initState();
    cache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Add this CustomPaint widget to the Widget Tree
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/new_map.png',
                    height: 500.0,
                    width: 500.0,
                  )),
            ),

            Text("Choose your prefrence"),
            Expanded(
              child: DropdownButton(
                value: dropdownvalue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(),
                onChanged: (newValue) async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('data', newValue.toString());
                  setState(() {
                    dropdownvalue = newValue.toString();
                  });
                },
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeScreen.screenId, (route) => false);
              },
              child: Text(
                "     NEXT     ",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
