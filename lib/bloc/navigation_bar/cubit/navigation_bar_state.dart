part of 'navigation_bar_cubit.dart';

enum NavBarItem {
  home,
  shoppingCard,
  account,
}

abstract class NavigationBarState extends Equatable {
  final NavBarItem navbarItem;
  final int index;

  const NavigationBarState(this.navbarItem, this.index);

  @override
  List<Object> get props => [navbarItem, index];
}

class NavigationBarInitial extends NavigationBarState {
  const NavigationBarInitial(super.navbarItem, super.index);
}

class NavigationBarHome extends NavigationBarState {
  const NavigationBarHome(super.navbarItem, super.index);
}

class NavigationBarShoppingCard extends NavigationBarState {
  const NavigationBarShoppingCard(super.navbarItem, super.index);
}

class NavigationBarAccount extends NavigationBarState {
  const NavigationBarAccount(super.navbarItem, super.index);
}
