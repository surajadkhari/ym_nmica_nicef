import 'package:flutter/material.dart';

import 'components/registration_widget.dart';

class RegistrationScreen extends StatelessWidget {
  static const screenId = "register";

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegistrationWidget(),
    );
  }
}
