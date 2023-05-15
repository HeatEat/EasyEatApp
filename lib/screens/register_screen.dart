import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_eat/core/constatnts.dart';
import 'package:easy_eat/screens/widgets/text_button_with_info_widget.dart';
import 'package:easy_eat/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../blocs/authentication/authentication_bloc.dart';
import '../core/app_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormBuilderState>();
  late String email;

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthVerifiState) {
          GoRouter.of(context).push(AppRoute.verificationscreen, extra: email);
        } else if (state is AuthAccountExistState) {
          context.showsnackbar(
              title: 'Konto o takim emailu istnieje, zaloguj sie',
              color: Colors.green.shade200);
          GoRouter.of(context).go(AppRoute.loginscreen);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
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
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.45,
                            child: FormBuilderTextField(
                              textCapitalization: TextCapitalization.words,
                              name: AuthK.nameString,
                              decoration: customInputDecoration(
                                  hintString: AuthK.nameStringHintText),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.45,
                            child: FormBuilderTextField(
                              textCapitalization: TextCapitalization.words,
                              name: AuthK.lastNameString,
                              decoration: customInputDecoration(
                                  hintString: AuthK.lastNameHintText),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHight * 0.02),
                      FormBuilderTextField(
                        name: AuthK.emailString,
                        decoration: customInputDecoration(
                            hintString: AuthK.emailString),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(height: screenHight * 0.02),
                      FormBuilderTextField(
                        name: AuthK.passwordString,
                        decoration: customInputDecoration(
                            hintString: AuthK.passwordHintText),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(height: screenHight * 0.02),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CountryCodePicker(
                              showDropDownButton: true,
                              initialSelection: 'PL',
                              favorite: const ['EN', 'PL'],
                              dialogBackgroundColor:
                                  Theme.of(context).colorScheme.background,
                              barrierColor:
                                  Theme.of(context).colorScheme.background,
                              textStyle: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: FormBuilderTextField(
                              name: AuthK.phoneNumberString,
                              decoration: customInputDecoration(
                                  hintString: AuthK.phoneNumberHintText),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric(),
                              ]),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHight * 0.02),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print("Valid");
                          }
                          // if (formKey.currentState!.validate()) {}
                          // email = 'rysiek9801@gmail.com';
                          // BlocProvider.of<AuthenticationBloc>(context).add(
                          //     const EmailSignUpAuthEvent(
                          //         "rysiek9801@gmail.com", "123456"));
                        },
                        child: const Text("Stwórz konto!"),
                      ),
                      SizedBox(height: screenHight * 0.005),
                      TextButtonWithInfo(
                          infoString: AppLocalizations.of(context).haveAccount,
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
      ),
    );
  }
}
