import 'package:flutter/material.dart';
import 'package:unicef/unicef/screens/searchbar_screen.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              child: Container(
                child: IgnorePointer(
                  child: TextField(
                    //readOnly: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {},
                      ),
                      hintText: "Search Indicator",
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 0.8),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 0.8, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchBarScreen()));
                print("----------------------------");
              },
            ),
          )
        ],
      ),
    );
  }
}
