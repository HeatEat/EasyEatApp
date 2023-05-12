import 'package:easy_eat/core/themes/app_theme.dart';
import 'package:easy_eat/screens/home_screen.dart';
import 'package:easy_eat/screens/login_screen.dart';
import 'package:easy_eat/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'bloc_observer.dart';
import 'blocs/autjentication/authentication_bloc.dart';
import 'core/constatnts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: zapisanie zmiennych do pamięci telefonu

  String supabaseBaseUrl = 'https://fdfztjjxeyumwufcsnno.supabase.co';
  String supabaseBaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZkZnp0amp4ZXl1bXd1ZmNzbm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODA4MDIzMjksImV4cCI6MTk5NjM3ODMyOX0.L5ZBBAPrld-UCxYwFYhBSxz8PLealrfRlRvoak_iyJU';

  // This will help you observe your Bloc
  Bloc.observer = MyBlocObserver();

  await Supabase.initialize(
    url: supabaseBaseUrl,
    anonKey: supabaseBaseKey,
    debug: true,
  );

  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthenticationBloc>(
      create: (_) => AuthenticationBloc(),
    ),
  ], child: MyApp()));
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
      home: RegisterScreen(),
    );
  }
}
