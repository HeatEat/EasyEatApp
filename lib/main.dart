import 'package:easy_eat/core/themes/app_theme.dart';
import 'package:easy_eat/screens/home_screen.dart';
import 'package:easy_eat/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'core/constatnts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: K.title,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}
