import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/theme.dart';
import 'package:flutter_app/routes/app_router.dart';

// Defines the main structure of the application, including the MaterialApp widget.
// Handles the app's theme, routes, and overall configuration.

class MyApp extends StatelessWidget {
MyApp({super.key});

final _myAppRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      routeInformationParser: _myAppRouter.router.routeInformationParser,
      routerDelegate: _myAppRouter.router.routerDelegate,
      routeInformationProvider: _myAppRouter.router.routeInformationProvider,
    );
  }
}
