import 'package:flutter/material.dart';

class K {
  static const title = 'EasyEat';
}

class AuthK extends K {
  static const noAccount = 'Nie posiadasz konta?';
  static const haveAccount = 'Posiadasz konto?';
  static const loginString = 'Zaloguj się!';
  static const register = 'Stwórz Konto';
  static const remindPassword = 'Przypomnij hasło';
  static const forgotPassword = 'Zapomniałeś hasło?';
  static const createAccount = 'Utwórz konto!';

  static const passwordString = 'password';
  static const passwordHintText = 'hasło';
  static const emailString = 'e-mail';
  static const nameString = 'firstName';
  static const nameStringHintText = 'imię';
  static const lastNameString = 'lastName';
  static const lastNameHintText = 'nazwisko';
}

class HomeScreenK extends K {
  static const pickUpPlace = 'Miejsce dostawy';
}

class BottomNavBarK extends K {
  static const home = "Strona główna";
  static const shopingCard = "Koszyk";
  static const account = 'Konto';
}

class Ui extends K {
  static const double borderRadius20 = 20.0;
}

InputDecoration customInputDecoration({required String hintString}) {
  return InputDecoration(
    hintText: hintString,
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(Ui.borderRadius20))),
  );
}
