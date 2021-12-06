import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicef/application/auth/auth_bloc.dart';
import 'package:unicef/common/utils/size_configs.dart';
import 'package:unicef/presentation/auth/login/login_screen.dart';
import 'package:unicef/presentation/splash/components/splash_widget.dart';
import 'package:unicef/unicef/screens/introduction_screen.dart';
import 'package:unicef/unicef/services/infomation_service.dart';

class SplashScreen extends StatelessWidget {
  static const screenId = "splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocListener<AuthBloc, AuthState>(
      child: const SplashWidget(),
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) async {
            InfomationService _informationService = InfomationService();

            var data = await _informationService.getDescriptions();

            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => IntroductionScreen(),
            //   ),
            // );

            Navigator.pushNamedAndRemoveUntil(
                context, IntroductionScreen.screenId, (route) => false);
          },
          unauthenticated: (_) async {
            await Future.delayed(const Duration(seconds: 4), () {
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginScreen.screenId, (route) => false);
            });
          },
        );
      },
    );
  }
}
