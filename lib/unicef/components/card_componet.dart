import 'dart:math';

import 'package:blurhash/blurhash.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hexcolor/hexcolor.dart';

class CardComponent extends StatefulWidget {
  final String? title;
  final String? color;
  final String? image;
  final int? id;
  final VoidCallback? press;
  const CardComponent({
    Key? key,
    required this.title,
    required this.image,
    required this.color,
    required this.press,
    required this.id,
  }) : super(key: key);

  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  bool isHover = false;
  Color? hoverColor;

  @override
  void initState() {
    super.initState();
    bool isHover = false;
    Color? hoverColor;
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        left: 25,
        right: 25,
      ),
      child: Container(
        width: double.infinity,
        height: 65.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: HexColor(
            widget.color.toString(),
          ),
          // Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ),
        child: Align(
          child: InkWell(
            onFocusChange: (object) {
              setState(() {
                isHover = true;
                hoverColor = Colors.red;
              });
            },
            onTap: widget.press,
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl: widget.image.toString(),
                        height: 32,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          "${widget.title!}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            overflow: TextOverflow.clip,
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
