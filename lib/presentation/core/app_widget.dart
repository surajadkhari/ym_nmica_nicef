import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicef/application/auth/auth_bloc.dart';
import 'package:unicef/injection.dart';
import 'package:unicef/common/utils/theme.dart';
import 'package:unicef/presentation/routes/router.gr.dart' as app_router;

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _appRouter = app_router.Router();

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
        home: MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
