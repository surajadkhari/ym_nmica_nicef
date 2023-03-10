import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicef/unicef/components/drawer.dart';

import 'package:unicef/unicef/screens/home_screen.dart';
import 'package:unicef/unicef/screens/notifications.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);
  static const screenId = "map_screen";

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapShapeSource? _shapeSource;
  List<MapModel>? _mapData;

  String dropdownvalue = 'Nepal';
  String value = '2019';

  var items = [
    'Nepal',
    'Province 1',
    'Madhesh',
    'Bagmati',
    'Gandaki',
    'Lumbini',
    'Karnali',
    'Sudoorpashchim',
  ];

  
  var years = [
    '2019',
    '2014',
    'Trend',
    
  ];

  cache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', "Nepal");
    await prefs.setString('year', "2019");
  }

  @override
  void initState() {
    super.initState();
    cache();
    _mapData = _getMapData();
    _shapeSource = MapShapeSource.asset('assets/nepal.json',
        shapeDataField: 'TARGET',
        dataCount: _mapData!.length,
        primaryValueMapper: (int index) => _mapData![index].state,
    
        shapeColorValueMapper: (int index) => _mapData![index].color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Preference",
          style: TextStyle(color: Colors.blue),
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: SfMaps(
              layers: <MapShapeLayer>[
                MapShapeLayer(
                  onSelectionChanged: (e) async {
                    final prefs = await SharedPreferences.getInstance();
                    if (e == 0) {
                      await prefs.setString('data', "Province 1");
                    }
                    if (e == 1) {
                      await prefs.setString('data', "Madhesh");
                    }
                    if (e == 2) {
                      await prefs.setString('data', "Bagmati");
                    }
                    if (e == 3) {
                      await prefs.setString('data', "Gandaki");
                    }
                    if (e == 4) {
                      await prefs.setString('data', "Lumbini");
                    }

                    if (e == 5) {
                      await prefs.setString('data', "Karnali");
                    }
                    if (e == 6) {
                      await prefs.setString('data', "Sudoorpashchim");
                    }
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeScreen.screenId, (route) => false);
                  },
                  source: _shapeSource!,
                  showDataLabels: true,
                  legend: MapLegend(MapElement.shape),
                  shapeTooltipBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.all(7),
                        child: Text(_mapData![index].state,
                            style: TextStyle(color: Colors.white)));
                  },
                  tooltipSettings: MapTooltipSettings(color: Colors.blue[900]),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Select province on the map by taping on province name"),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Or"),
          SizedBox(
            height: 10,
          ),
          Text("Choose your prefrence"),
          SizedBox(
            height: 10,
          ),
          DropdownButton(
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

            Text("Choose year"),
          SizedBox(
            height: 10,
          ),
          DropdownButton(
            value: value,
            icon: Icon(Icons.keyboard_arrow_down),
            items: years.map((String years) {
              return DropdownMenuItem(value: years, child: Text(years));
            }).toList(),
            onChanged: (newValue) async {
              print("-------");
              print(newValue);
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('year', newValue.toString());
              setState(() {
                value = newValue.toString();
              });
            },
          ),
          SizedBox(
            height: 20,
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
      drawer: DrawerNavigation(),
    );
  }

  static List<MapModel> _getMapData() {
    return <MapModel>[
      MapModel('Province1', '', Colors.amber),
      MapModel('Madhesh', '', Colors.cyan),
      MapModel('Bagmati', '', Colors.blue),
      MapModel('Gandaki', '', Colors.red),
      MapModel('Lumbini', '', Colors.purple),
      MapModel('Karnali', '', Colors.lightGreenAccent),
      MapModel('Sudoorpashchim', '', Colors.indigo),
    ];
  }
}

class MapModel {
  MapModel(this.state, this.stateCode, this.color);

  String state;
  String stateCode;
  Color color;
}
