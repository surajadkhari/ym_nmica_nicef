import 'package:auto_route/annotations.dart';
import 'package:unicef/presentation/auth/login/login_screen.dart';
import 'package:unicef/presentation/splash/splash_screen.dart';
import 'package:unicef/unicef/screens/home_screen.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: HomeScreen),
  ],
)
class $AppRouter {}
