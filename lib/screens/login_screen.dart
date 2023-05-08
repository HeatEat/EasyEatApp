import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../core/constatnts.dart';
import 'widgets/text_button_with_info_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FormBuilder(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: Column(
                children: [
                  const Text(
                    K.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Image.asset(
                    "assets/source.gif",
                    width: 200,
                  ),
                  FormBuilderTextField(
                    name: 'e-mail',
                    decoration: customInputDecoration(hintString: "e-mail"),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    name: 'password',
                    decoration: const InputDecoration(
                      hintText: 'hasło',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Ui.borderRadius20))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Zaloguj'),
                  ),
                  TextButtonWithInfo(
                      infoString: AuthK.noAccount,
                      textButtonCallback: () {},
                      textButtonChild: AuthK.register),
                  TextButtonWithInfo(
                    infoString: AuthK.forgotPassword,
                    textButtonCallback: () {},
                    textButtonChild: AuthK.remindPassword,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
