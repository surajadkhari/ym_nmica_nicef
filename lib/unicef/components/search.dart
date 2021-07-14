import 'package:flutter/material.dart';

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
            child: TextField(
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
          )
        ],
      ),
    );
  }
}
