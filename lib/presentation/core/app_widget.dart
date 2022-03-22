import 'package:flutter/material.dart' hide Router;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicef/application/auth/auth_bloc.dart';
import 'package:unicef/injection.dart';
import 'package:unicef/common/utils/theme.dart';
import 'package:unicef/presentation/auth/login/login_screen.dart';
import 'package:unicef/presentation/auth/registration/registration_screen.dart';
import 'package:unicef/presentation/splash/splash_screen.dart';
import 'package:unicef/unicef/screens/home_screen.dart';
import 'package:unicef/unicef/screens/introduction_screen.dart';
import 'package:unicef/unicef/screens/main_screen.dart';
import 'package:unicef/unicef/screens/map_screen.dart';
import 'package:unicef/unicef/screens/sync_screen.dart';

class AppWidget extends StatefulWidget {
  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        )
      ],
      child: MaterialApp(
        title: 'NMICS',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          RegistrationScreen.screenId: (context) => RegistrationScreen(),
          LoginScreen.screenId: (context) => LoginScreen(),
          IntroductionScreen.screenId: (context) => IntroductionScreen(),
          HomeScreen.screenId: (context) => HomeScreen(),
          MapScreen.screenId: (context) => MapScreen(),
          SyncScreen.screenId: (context) => SyncScreen(),
          MainScreen.screenId: (context) => MainScreen(),
        },
      ),
    );
  }
}
