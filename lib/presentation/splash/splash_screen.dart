import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicef/application/auth/auth_bloc.dart';
import 'package:unicef/common/utils/size_configs.dart';
import 'package:unicef/presentation/routes/router.gr.dart';
import 'package:unicef/presentation/splash/components/splash_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) => {
            AutoRouter.of(context).navigate(const HomeScreen()),
          },
          unauthenticated: (_) {
            AutoRouter.of(context).navigate(const LoginScreen());
          },
        );
      },
      child: const SplashWidget(),
    );
  }
}
