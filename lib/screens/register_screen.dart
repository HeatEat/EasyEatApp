import 'package:easy_eat/core/constatnts.dart';
import 'package:easy_eat/screens/widgets/text_button_with_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../blocs/authentication/authentication_bloc.dart';
import '../core/app_router.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthVerifiState) {
          GoRouter.of(context).go(AppRoute.verificationscreen);
        } else if (state is AuthAccountExistState) {
          GoRouter.of(context).go(AppRoute.loginscreen);
        }
      },
      child: Scaffold(
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
                      onPressed: () {
                        BlocProvider.of<AuthenticationBloc>(context).add(
                            const EmailSignUpAuthEvent(
                                "ryszard.schossler@gmail.com", "123456"));
                      },
                      child: const Text("Stwórz konto!"),
                    ),
                    SizedBox(height: screenHight * 0.005),
                    TextButtonWithInfo(
                        infoString: AuthK.haveAccount,
                        textButtonCallback: () {
                          GoRouter.of(context).go(AppRoute.loginscreen);
                        },
                        textButtonChild: AuthK.loginString),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
