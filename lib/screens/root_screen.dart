import 'package:easy_eat/screens/account_screen.dart';
import 'package:easy_eat/screens/home_screen.dart';
import 'package:easy_eat/screens/shopping_card_screen.dart';
import 'package:easy_eat/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/authentication/authentication_bloc.dart';
import '../bloc/navigation_bar/cubit/navigation_bar_cubit.dart';
import '../core/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        // if (state is AuthSuccessState) {
        //   GoRouter.of(context).go(AppRoute.root);
        // }
        //  else
        if (state is UnAuthenticatedState) {
          GoRouter.of(context).go(AppRoute.loginscreen);
        } else if (state is AuthErrorState) {
          context.showsnackbar(
              title: AppLocalizations.of(context).somethingWentWrong);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<NavigationBarCubit, NavigationBarState>(
            builder: (context, state) {
              if (state.navbarItem == NavBarItem.home) {
                return const HomeScreen();
              } else if (state.navbarItem == NavBarItem.shoppingCard) {
                return const ShoppingCardScreen();
              } else if (state.navbarItem == NavBarItem.account) {
                return const AccountScreen();
              }
              return Container();
            },
          ),
        ),
        bottomNavigationBar:
            BlocBuilder<NavigationBarCubit, NavigationBarState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state.index,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home_rounded),
                  label: AppLocalizations.of(context).home,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.shopping_cart_rounded),
                  label: AppLocalizations.of(context).shoppingCard,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person_2_rounded),
                  label: AppLocalizations.of(context).account,
                ),
              ],
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<NavigationBarCubit>(context)
                      .getNavBarItem(NavBarItem.home);
                } else if (index == 1) {
                  BlocProvider.of<NavigationBarCubit>(context)
                      .getNavBarItem(NavBarItem.shoppingCard);
                } else if (index == 2) {
                  BlocProvider.of<NavigationBarCubit>(context)
                      .getNavBarItem(NavBarItem.account);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
