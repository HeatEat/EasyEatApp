part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthLoadingState extends AuthenticationState {}

class AuthSuccessState extends AuthenticationState {}

class AuthErrorState extends AuthenticationState {
  final String error;

  const AuthErrorState(this.error);
}

class UnAuthenticatedState extends AuthenticationState {
  const UnAuthenticatedState();
}
