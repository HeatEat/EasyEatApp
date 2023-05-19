import 'package:easy_eat/blocs/authentication/authentication_bloc.dart';
import 'package:easy_eat/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../core/app_router.dart';
import '../core/constatnts.dart';
import 'widgets/text_button_with_info_widget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          context.showsnackbar(
              title: AppLocalizations.of(context).somethingWentWrong);
        } else if (state is AuthEmailNotConfirmedState) {
          context.showsnackbar(
              title: AppLocalizations.of(context).emailNotConfirmed,
              color: Colors.yellow.shade200);
          // TODO: wywołanie sign-up i wyświetlenie ekranu otpVerification
          // dodanie nowego evantu dla nowego ekranu weryfikacyjengo OTP.
        } else if (state is AuthInvalidCredentialState) {
          context.showsnackbar(
              title: AppLocalizations.of(context).invalidCredentials,
              color: Colors.red.shade200);
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
                      decoration: customInputDecoration(
                          hintString: AppLocalizations.of(context).email),
                    ),
                    const SizedBox(height: 10),
                    FormBuilderTextField(
                      name: 'password',
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context).password,
                        border: const OutlineInputBorder(
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
                                      "ryszard1.schossler@gmail.com",
                                      "Hasfelder9283"));
                            },
                            child: const Text('Zaloguj'),
                          );
                        }
                      },
                    ),
                    TextButtonWithInfo(
                        infoString: AppLocalizations.of(context).noAccount,
                        textButtonCallback: () {
                          GoRouter.of(context).go(AppRoute.registerscreen);
                        },
                        textButtonChild:
                            AppLocalizations.of(context).createAccount),
                    TextButtonWithInfo(
                      infoString: AppLocalizations.of(context).forgotPassword,
                      textButtonCallback: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(const SignOutEvent());
                      },
                      textButtonChild:
                          AppLocalizations.of(context).remindPassowrd,
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
