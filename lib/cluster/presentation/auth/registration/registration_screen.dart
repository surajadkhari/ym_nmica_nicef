import 'package:flutter/material.dart';
import 'package:unicef/unicef/presentation/auth/registration/components/registration_widget.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegistrationWidget(),
    );
  }
}
