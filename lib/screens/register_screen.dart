import 'package:easy_eat/core/constatnts.dart';
import 'package:easy_eat/screens/widgets/text_button_with_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHight * 0.1),
            const Text(
              AuthK.createAccount,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHight * 0.02),
            FormBuilder(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.45,
                        child: FormBuilderTextField(
                          name: AuthK.nameString,
                          decoration: customInputDecoration(
                              hintString: AuthK.nameStringHintText),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.45,
                        child: FormBuilderTextField(
                          name: AuthK.lastNameString,
                          decoration: customInputDecoration(
                              hintString: AuthK.lastNameHintText),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHight * 0.02),
                  FormBuilderTextField(
                    name: AuthK.emailString,
                    decoration:
                        customInputDecoration(hintString: AuthK.emailString),
                  ),
                  SizedBox(height: screenHight * 0.02),
                  FormBuilderTextField(
                    name: AuthK.passwordString,
                    decoration: customInputDecoration(
                        hintString: AuthK.passwordHintText),
                  ),
                  SizedBox(height: screenHight * 0.02),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Stwórz konto!"),
                  ),
                  SizedBox(height: screenHight * 0.005),
                  TextButtonWithInfo(
                      infoString: AuthK.haveAccount,
                      textButtonCallback: () {},
                      textButtonChild: AuthK.loginString),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
