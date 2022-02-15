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
    _mapData = _getMapData();
    _shapeSource = MapShapeSource.asset('assets/nepal.json',
        shapeDataField: 'TARGET',
        dataCount: _mapData!.length,
        primaryValueMapper: (int index) => _mapData![index].state,
        dataLabelMapper: (int index) => _mapData![index].state,
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
                      await prefs.setString('data', "Province 2");
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
                      await prefs.setString('data', "Sudurpashchim");
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
          Text("Select province on the map by taping on province name"),
          Text("Or"),
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
    );
  }

  static List<MapModel> _getMapData() {
    return <MapModel>[
      MapModel('Province1', '', Colors.amber),
      MapModel('Province2', '', Colors.cyan),
      MapModel('Bagmati', '', Colors.amber),
      MapModel('Gandaki', '', Colors.red),
      MapModel('Lumbini', '', Colors.purple),
      MapModel('Karnali', '', Colors.lightGreenAccent),
      MapModel('Sudurpaschim', '', Colors.indigo),
    ];
  }
}

class MapModel {
  MapModel(this.state, this.stateCode, this.color);

  String state;
  String stateCode;
  Color color;
}
