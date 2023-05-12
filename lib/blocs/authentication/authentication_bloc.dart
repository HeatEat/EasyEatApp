import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
        final accountState = await _authservice.signUpWithEmail(
            email: event.email, password: event.password);

        print(accountState);
        if (accountState == AccountState.createdNotVerify) {
          emit(AuthVerifiState());
        } else if (accountState == AccountState.createdVerify) {
          emit(AuthAccountExistState());
        }
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });

    on<SignOutEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await _authservice.signOut();
        emit(const UnAuthenticatedState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });

    on<VerificationAuthEvent>(
      (event, emit) {
        emit(AuthVerifiState());
      },
    );
  }
}
