import 'package:flutter/material.dart';
import 'package:flutter_app/features/onboarding/presentation/views/onboarding_page.dart';
import 'package:flutter_app/features/splashscreen/splash_screen.dart';
import 'package:flutter_app/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  //Initial Page is set to SplashScreen
  GoRouter router = GoRouter(
    initialLocation: '/onboarding',
    routes: [
      //Route for Splash Screen
      GoRoute(
        name: AppRouteConstants.splash,
        path: '/splashscreen',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SplashScreen(),
          );
        },
      ),
      //Route for Onboarding Page
      GoRoute(
        name: AppRouteConstants.onboarding,
        path: '/onboarding',
        pageBuilder: (context, state) {
          return MaterialPage(
            child:OnboardingPage(),
          );
        },
      ),
    ],
  );
}
