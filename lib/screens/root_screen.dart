import 'package:easy_eat/blocs/navigation_bar/cubit/navigation_bar_cubit.dart';
import 'package:easy_eat/screens/widgets/select_pickup_place_widget.dart';
import 'package:easy_eat/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/authentication/authentication_bloc.dart';
import '../core/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          GoRouter.of(context).go(AppRoute.root);
        } else if (state is UnAuthenticatedState) {
          GoRouter.of(context).go(AppRoute.loginscreen);
        } else if (state is AuthErrorState) {
          context.showsnackbar(
              title: AppLocalizations.of(context).somethingWentWrong);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SelectPickUpPlace(),
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.search_rounded),
                        label: const Text("")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryItem(
                        categoryName: "Wszystkie",
                        selectCategory: () {},
                      ),
                      CategoryItem(
                        categoryName: "Burger",
                        selectCategory: () {},
                      ),
                      CategoryItem(
                        categoryName: "Pizza",
                        selectCategory: () {},
                      ),
                      CategoryItem(
                        categoryName: "Włoska",
                        selectCategory: () {},
                      ),
                      CategoryItem(
                        categoryName: "Hinduska",
                        selectCategory: () {},
                      ),
                      CategoryItem(
                        categoryName: "Turecka",
                        selectCategory: () {},
                      ),
                      CategoryItem(
                        categoryName: "Kebab",
                        selectCategory: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
        floatingActionButton: FloatingActionButton(onPressed: () {
          BlocProvider.of<AuthenticationBloc>(context)
              .add(const SignOutEvent());
        }),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryName,
    required this.selectCategory,
  });

  final String categoryName;
  final VoidCallback selectCategory;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectCategory,
      child: Row(
        children: [
          const SizedBox(width: 8),
          Card(
            color: Theme.of(context).highlightColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(categoryName),
            ),
          ),
        ],
      ),
    );
  }
}
