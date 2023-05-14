import 'package:easy_eat/blocs/authentication/authentication_bloc.dart';
import 'package:easy_eat/core/app_router.dart';
import 'package:easy_eat/core/constatnts.dart';
import 'package:easy_eat/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class VerificationScreen extends StatelessWidget {
  String? email;
  VerificationScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final codeBoxHeight = (screenHight / 6) * 0.45;
    final codeBoxWidth = (screenWidth / 6) * 0.85;
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthVerifiErrorState) {
          context.showsnackbar(title: 'Niepoprawny kod, Spróbuj ponownie');
        } else if (state is AuthVerifiSuccessState) {
          GoRouter.of(context).go(AppRoute.homescreen);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, screenHight * 0.15, 8, 8),
            child: Column(children: [
              const Text(
                VerificationScreenK.verificationCodeString,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const Text(
                VerificationScreenK.verificationMessage,
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
                          height: codeBoxHeight,
                          width: codeBoxWidth,
                          child: FormBuilderTextField(
                            onChanged: (value) {
                              if (value!.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            name: VerificationScreenK.firstDigitInput,
                            decoration: customInputDecoration(hintString: ''),
                            style: Theme.of(context).textTheme.headlineSmall,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: FormBuilderValidators.required(),
                          ),
                        ),
                        SizedBox(
                          height: codeBoxHeight,
                          width: codeBoxWidth,
                          child: FormBuilderTextField(
                            onChanged: (value) {
                              if (value!.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                              if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            name: VerificationScreenK.secondDigitInput,
                            decoration: customInputDecoration(hintString: ''),
                            style: Theme.of(context).textTheme.headlineSmall,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: FormBuilderValidators.required(),
                          ),
                        ),
                        SizedBox(
                          height: codeBoxHeight,
                          width: codeBoxWidth,
                          child: FormBuilderTextField(
                            onChanged: (value) {
                              if (value!.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                              if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            name: VerificationScreenK.thirdDigitInput,
                            decoration: customInputDecoration(hintString: ''),
                            style: Theme.of(context).textTheme.headlineSmall,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: FormBuilderValidators.required(),
                          ),
                        ),
                        SizedBox(
                          height: codeBoxHeight,
                          width: codeBoxWidth,
                          child: FormBuilderTextField(
                            onChanged: (value) {
                              if (value!.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                              if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            name: VerificationScreenK.fourthDigitInput,
                            decoration: customInputDecoration(hintString: ''),
                            style: Theme.of(context).textTheme.headlineSmall,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: FormBuilderValidators.required(),
                          ),
                        ),
                        SizedBox(
                          height: codeBoxHeight,
                          width: codeBoxWidth,
                          child: FormBuilderTextField(
                            onChanged: (value) {
                              if (value!.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                              if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            name: VerificationScreenK.fifthDigitInput,
                            decoration: customInputDecoration(hintString: ''),
                            style: Theme.of(context).textTheme.headlineSmall,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: FormBuilderValidators.required(),
                          ),
                        ),
                        SizedBox(
                          height: codeBoxHeight,
                          width: codeBoxWidth,
                          child: FormBuilderTextField(
                            onChanged: (value) {
                              if (value!.length == 1) {
                                if (formKey.currentState!.validate()) {
                                  String otpCode = '';
                                  for (var digit
                                      in VerificationScreenK.otpInputs) {
                                    otpCode += formKey
                                        .currentState?.fields[digit]?.value;
                                  }
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(VerifiAccountEvent(otpCode, email!));
                                } else {
                                  print("Ended verify not validate");
                                }
                              }
                              if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            name: VerificationScreenK.sixthDigitInput,
                            decoration: customInputDecoration(hintString: ''),
                            style: Theme.of(context).textTheme.headlineSmall,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: FormBuilderValidators.required(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHight * 0.02),
                    // ElevatedButton(onPressed: () {}, child: Text("Weryfikuj"))
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
