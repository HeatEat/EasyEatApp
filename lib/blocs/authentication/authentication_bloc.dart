import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../utils/services/auth_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService _authservice = AuthService();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<EmailSignInAuthEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await _authservice.signInWithEmail(
            email: event.email, password: event.password);

        emit(AuthSuccessState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });

    on<EmailSignUpAuthEvent>((event, emit) async {
      emit(AuthLoadingState());

      try {
        await _authservice.signUpWithEmail(
            email: event.email, password: event.password);
        emit(AuthSuccessState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });
  }
}
