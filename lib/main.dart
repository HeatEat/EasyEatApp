import 'package:easy_eat/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'bloc_observer.dart';
import 'blocs/authentication/authentication_bloc.dart';
import 'core/app_router.dart';
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
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: K.title,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routeInformationProvider: AppRoute.router.routeInformationProvider,
      routeInformationParser: AppRoute.router.routeInformationParser,
      routerDelegate: AppRoute.router.routerDelegate,
      supportedLocales: const [
        Locale('pl'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
    );
  }
}
