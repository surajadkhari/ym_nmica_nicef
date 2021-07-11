import 'package:flutter/material.dart';
import 'package:unicef/common/utils/size_configs.dart';
import 'package:unicef/presentation/splash/components/splash_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: SplashWidget(),
    );
  }
}
