import 'package:flutter/material.dart';
import 'package:unicef/common/utils/size_configs.dart';
import 'components/splash_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SplashWidget(),
    );
  }
}
