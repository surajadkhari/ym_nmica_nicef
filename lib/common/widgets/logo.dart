import 'package:flutter/material.dart';
import 'package:unicef/common/utils/size_configs.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Image.asset(
        'assets/images/logo.png',
        width: getProportionateScreenWidth(300.0),
        height: getProportionateScreenHeight(200.0),
      ),
    );
  }
}
