import 'dart:math';

import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final String? title;
  final String? image;
  final int? id;
  final VoidCallback? press;
  const CardComponent({
    Key? key,
    required this.title,
    required this.image,
    required this.press,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 7,
        left: 25,
        right: 25,
      ),
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Align(
          child: GestureDetector(
            onTap: press,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        image.toString(),
                        height: 50,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(border: Border()),
                        child: Text(
                          "${title!}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
