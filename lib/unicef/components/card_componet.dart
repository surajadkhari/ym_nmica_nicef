import 'dart:math';

import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final String? title;
  final int? id;
  final VoidCallback? press;
  const CardComponent({
    Key? key,
    required this.title,
    required this.press,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 150.0,
        height: 120.0,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Align(
          child: GestureDetector(
            onTap: press,
            child: Container(
              decoration: const BoxDecoration(border: Border()),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text(
                  title!,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
