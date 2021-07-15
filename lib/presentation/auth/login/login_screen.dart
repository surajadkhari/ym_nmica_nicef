import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicef/application/auth/signin_form/signin_form_bloc.dart';
import 'package:unicef/injection.dart';
import 'components/login_wiget.dart';

class LoginScreen extends StatelessWidget {
  static const screenId = "login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<SigninFormBloc>(),
        child: const LoginWidget(),
      ),
    );
  }
}
