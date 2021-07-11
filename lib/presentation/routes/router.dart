import 'package:auto_route/annotations.dart';
import 'package:unicef/presentation/auth/login/login_screen.dart';
import 'package:unicef/presentation/splash/splash_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: LoginScreen),
  ],
)
class $Router {}
