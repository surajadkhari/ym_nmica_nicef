import 'package:flutter/material.dart';
import 'package:unicef/common/utils/appbar_theme.dart';
import 'package:unicef/common/utils/text_theme.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity);
}
