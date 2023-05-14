import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AccountState {
  createdNotVerify,
  createdVerify,
}

enum SignInState { success, emailNotConfirmed, otherError }

class AuthService {
  final GoTrueClient _auth = Supabase.instance.client.auth;

  AuthService();

  Future<SignInState> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithPassword(email: email, password: password);
      return SignInState.emailNotConfirmed;
    } on AuthException catch (e) {
      if (e.message == 'Email not confirmed') {
        return SignInState.emailNotConfirmed;
      }
      return SignInState.otherError;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<AccountState> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      final response =
          await _auth.signUp(email: email, password: password, data: {
        'first_name': 'John',
        'last_name': 'Smith',
        'phone': '2134',
        'country_phone': '+48'
      });
      // ignore: unrelated_type_equality_checks
      if (response.session == Null) {
        debugPrint("session is null");
      }
      if (response.user!.identities!.isEmpty) {
        return AccountState.createdVerify;
      } else {
        return AccountState.createdNotVerify;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> anounymousSignIn() async {
    try {
      await _auth.signInWithPassword(
          email: 'omar@gmail.com', password: '123456');
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await _auth.signInWithOAuth(Provider.google);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> otpVerify({required String email, required String token}) async {
    try {
      await _auth.verifyOTP(token: token, type: OtpType.signup, email: email);
    } catch (e) {
      throw e.toString();
    }
  }
}
