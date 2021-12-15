import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:open_settings/open_settings.dart';
import 'package:unicef/unicef/components/singl_chart.dart';
import 'package:unicef/unicef/models/Indicators.dart';

import 'package:unicef/unicef/services/serach_indicators.dart';
import 'package:unicef/unicef/widgets/CheckBoxState.dart';

// ignore: must_be_immutable
class SearchWidget extends StatefulWidget {
  static SearchIndicator _indicatorSearch = SearchIndicator();

  Future<List<CheckBoxState>>? futureData;
  SearchWidget({
    Key? key,
    this.futureData,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: () async {
                var connection = await Connectivity().checkConnectivity();
                if (connection == ConnectivityResult.none) {
                  final snackBar = SnackBar(
                    content: Text(
                        'Turn on your internet connection to use this feature!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  await Future.delayed(const Duration(seconds: 2), () {
                    OpenSettings.openWIFISetting();
                  });
                } else {
                  showSearch(context: context, delegate: DataSearch());
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        color: Color(0xFF013856).withAlpha(25),
                        offset: Offset(0, 10))
                  ],
                  // color: HexColor(
                  //   widget.color.toString(),
                  // ),
                  // Colors.primaries[Random().nextInt(Colors.primaries.length)],
                ),
                child: GestureDetector(
                  onTap: () async {
                    var connection = await Connectivity().checkConnectivity();
                    if (connection == ConnectivityResult.none) {
                      final snackBar = SnackBar(
                        content: Text(
                            'Turn on your internet connection to use this feature!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      await Future.delayed(const Duration(seconds: 2), () {
                        OpenSettings.openWIFISetting();
                      });
                    } else {
                      showSearch(context: context, delegate: DataSearch());
                    }
                  },
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          print("ok");
                        },
                      ),
                      hintText: "Search Indicator",
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 0.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 0.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  // var suggestionFor = ['abc', 'efg', 'hij'];
  // var suggestionAll = ['ghi', 'jl', 'hij'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) =>
      FutureBuilder<List<Indicator>>(
        future: SearchWidget._indicatorSearch.getSearch(name: query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Indicator>? data = snapshot.data;

            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(data[index].name!),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => SingleChart(
                          id: data[index].id,
                          name: data[index].name,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else
            return Center(child: Text("Type Something"));
        },
      );
}
