import 'package:flutter/material.dart';
import 'package:flutter_app/features/auth/presentation/views/login_page.dart';
import 'package:flutter_app/features/auth/presentation/views/set_password_page.dart';
import 'package:flutter_app/features/auth/presentation/views/signup_page1.dart';
import 'package:flutter_app/features/auth/presentation/views/signup_page2.dart';
import 'package:flutter_app/features/auth/presentation/views/signup_page3.dart';
import 'package:flutter_app/features/onboarding/presentation/views/onboarding_page.dart';
import 'package:flutter_app/features/splashscreen/splash_screen.dart';
import 'package:flutter_app/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/${AppRouteConstants.onboarding}',
    routes: [
      // Route for Splash Screen
      GoRoute(
        name: AppRouteConstants.splash,
        path: '/${AppRouteConstants.splash}', 
        pageBuilder: (context, state) {
          return const MaterialPage(child: SplashScreen());
        },
      ),
      // Route for Onboarding Page
      GoRoute(
        name: AppRouteConstants.onboarding,
        path: '/${AppRouteConstants.onboarding}', 
        pageBuilder: (context, state) {
          return const MaterialPage(child: OnboardingPage());
        },
      ),
      // Route for Login Page
      GoRoute(
        name: AppRouteConstants.login,
        path: '/${AppRouteConstants.login}', 
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginPage());
        },
      ),
      // Route for first Signup page
      GoRoute(
        name: AppRouteConstants.signup1,
        path: '/${AppRouteConstants.signup1}',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignupPage1());
        },
      ),
      // Route for second Signup page
      GoRoute(
        name: AppRouteConstants.signup2,
        path: '/${AppRouteConstants.signup2}', 
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignupPage2());
        },
      ),
      // Route for third Signup page
      GoRoute(
        name: AppRouteConstants.signup3,
        path: '/${AppRouteConstants.signup3}', 
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignupPage3());
        },
      ),
      // Route for Set password Page
      GoRoute(
        name: AppRouteConstants.setpassword,
        path: '/${AppRouteConstants.setpassword}', 
        pageBuilder: (context, state) {
          return const MaterialPage(child: SetPasswordPage());
        },
      ),
    ],
  );
}
