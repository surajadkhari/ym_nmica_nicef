import 'package:flutter/material.dart';
import 'package:unicef/unicef/presentation/auth/login/components/login_wiget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginWidget(),
    );
  }
}
