import 'package:easy_eat/screens/home_screen.dart';
import 'package:easy_eat/screens/login_screen.dart';
import 'package:easy_eat/screens/register_screen.dart';
import 'package:easy_eat/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppRoute {
  static const root = '/';
  static const welcomescreen = '/welcomescreen';
  static const loginscreen = '/loginscreen';
  static const registerscreen = '/registerscreen';
  static const homescreen = '/homescreen';
  static const verificationscreen = '/verificationscreen';

  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: root,
        builder: (context, state) {
          if (Supabase.instance.client.auth.currentUser != null) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
      GoRoute(
        path: loginscreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: registerscreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: homescreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: verificationscreen,
        builder: (context, state) {
          String email = state.extra as String;
          return VerificationScreen(
            email: email,
          );
        },
      ),
    ],
    initialLocation: root,
    errorBuilder: (context, state) => const Center(
      child: Text("This page does'nt exist!"),
    ),
  );

  static GoRouter get router => _router;
}
