import 'package:easy_eat/blocs/authentication/authentication_bloc.dart';
import 'package:easy_eat/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../core/app_router.dart';
import '../core/constatnts.dart';
import 'widgets/text_button_with_info_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          GoRouter.of(context).go(AppRoute.homescreen);
        } else if (state is UnAuthenticatedState) {
          GoRouter.of(context).go(AppRoute.loginscreen);
        } else if (state is AuthErrorState) {
          context.showsnackbar(title: 'Something Went Wrong!');
        } else if (state is AuthEmailNotConfirmedState) {
          context.showsnackbar(
              title: 'Email nie potwierdzony', color: Colors.yellow.shade200);
          // TODO: wywołanie sign-up i wyświetlenie ekranu otpVerification
          // dodanie nowego evantu dla nowego ekranu weryfikacyjengo OTP.
        }
      },
      child: Scaffold(
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
                    BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                        if (state is AuthLoadingState) {
                          return const CircularProgressIndicator(
                            color: Colors.green,
                          );
                        } else {
                          return ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<AuthenticationBloc>(context).add(
                                  const EmailSignInAuthEvent(
                                      "rysiek9801@gmail.com", "123456"));
                            },
                            child: const Text('Zaloguj'),
                          );
                        }
                      },
                    ),
                    TextButtonWithInfo(
                        infoString: AuthK.noAccount,
                        textButtonCallback: () {
                          GoRouter.of(context).go(AppRoute.registerscreen);
                        },
                        textButtonChild: AuthK.register),
                    TextButtonWithInfo(
                      infoString: AuthK.forgotPassword,
                      textButtonCallback: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(const SignOutEvent());
                      },
                      textButtonChild: AuthK.remindPassword,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
