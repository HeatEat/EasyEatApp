import 'package:easy_eat/core/constatnts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final secondDigitController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final codeBoxHeight = (screenHight / 6) * 0.45;
    final codeBoxWidth = (screenWidth / 6) * 0.85;
    return Scaffold(
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
                          name: VerificationScreenK.secondDigitInput,
                          decoration: customInputDecoration(hintString: ''),
                          style: Theme.of(context).textTheme.headlineSmall,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
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
                        ),
                      ),
                      SizedBox(
                        height: codeBoxHeight,
                        width: codeBoxWidth,
                        child: FormBuilderTextField(
                          onChanged: (value) {
                            if (value!.length == 1) {}
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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHight * 0.02),
                  ElevatedButton(onPressed: () {}, child: Text("Weryfikuj"))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
