import 'package:easy_eat/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../bloc/authentication/authentication_bloc.dart';
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
          GoRouter.of(context).go(AppRoute.root);
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
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormBuilder(
                key: formKey,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        keyboardType: TextInputType.emailAddress,
                        enableSuggestions: true,
                        textCapitalization: TextCapitalization.none,
                        name: AuthK.emailString,
                        decoration: customInputDecoration(
                            hintString: AppLocalizations.of(context).email),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderTextField(
                        name: AuthK.passwordString,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context).password,
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Ui.borderRadius20))),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(8),
                        ]),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
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
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(EmailSignInAuthEvent(
                                    formKey.currentState!
                                        .fields[AuthK.emailString]!.value,
                                    formKey.currentState!
                                        .fields[AuthK.passwordString]!.value,
                                  ));
                                }
                              },
                              child: Text(AppLocalizations.of(context).login),
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
      ),
    );
  }
}
