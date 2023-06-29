import 'package:easy_eat/bloc/categories/categories_bloc.dart';
import 'package:easy_eat/bloc/navigation_bar/cubit/navigation_bar_cubit.dart';
import 'package:easy_eat/core/themes/app_theme.dart';
import 'package:easy_eat/data/data_sources/supabase_data_source.dart';
import 'package:easy_eat/data/repositories/easy_eat_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'bloc_observer.dart';
import 'bloc/authentication/authentication_bloc.dart';
import 'core/app_router.dart';
import 'core/constatnts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  String supabaseBaseUrl = dotenv.env['SUPABASE_BASE_URL'] ?? '';
  String supabaseBaseKey = dotenv.env['SUPABASE_BASE_KEY'] ?? '';

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
    BlocProvider<NavigationBarCubit>(
      create: (_) => NavigationBarCubit(),
    ),
    BlocProvider<CategoriesBloc>(
      create: (_) =>
          CategoriesBloc(EasyEatRepositoryImpl(SupabaseDataSourceImp())),
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
