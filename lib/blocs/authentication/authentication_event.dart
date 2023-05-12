part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class EmailSignInAuthEvent extends AuthenticationEvent {
  final String email, password;

  const EmailSignInAuthEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class EmailSignUpAuthEvent extends AuthenticationEvent {
  final String email, password;

  const EmailSignUpAuthEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class AnounymousAuthEvent extends AuthenticationEvent {
  const AnounymousAuthEvent();
}

class SignOutEvent extends AuthenticationEvent {
  const SignOutEvent();
}

class VerificationAuthEvent extends AuthenticationEvent {
  final String email, password;
  const VerificationAuthEvent(this.email, this.password);
}
