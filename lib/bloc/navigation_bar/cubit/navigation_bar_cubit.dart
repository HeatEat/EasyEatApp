import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(const NavigationBarHome(NavBarItem.home, 0));

  void getNavBarItem(NavBarItem navBarItem) {
    switch (navBarItem) {
      case NavBarItem.home:
        emit(const NavigationBarHome(NavBarItem.home, 0));
        break;
      case NavBarItem.shoppingCard:
        emit(const NavigationBarShoppingCard(NavBarItem.shoppingCard, 1));
        break;
      case NavBarItem.account:
        emit(const NavigationBarAccount(NavBarItem.account, 2));
        break;
    }
  }
}
