import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AccountState {
  createdNotVerify,
  createdVerify,
}

class AuthService {
  final GoTrueClient _auth = Supabase.instance.client.auth;

  AuthService();

  Future<void> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithPassword(email: email, password: password);
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
