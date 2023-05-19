import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(NavigationBarInitial());
}
