import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;

  static double? screenHeight;
  static double? screenWidth;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData!.size.height;
    screenWidth = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

double getProportionateScreenHeight(double inputHeight) {
  var screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight!;
}

double getProportionateScreenWidth(double inputWidth) {
  var screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth!;
}
