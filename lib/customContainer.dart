import 'dart:async';

import 'package:clipper_textformfield_showdialogs_f18assignment/clipperContainer/loginButtonDialog.dart';
import 'package:clipper_textformfield_showdialogs_f18assignment/clipperContainer/mid_Containerclipper.dart';
import 'package:clipper_textformfield_showdialogs_f18assignment/dialogs/clearButtonDialog.dart';
import 'package:clipper_textformfield_showdialogs_f18assignment/password.dart';
import 'package:clipper_textformfield_showdialogs_f18assignment/textFormFields.dart/email.dart';
import 'package:clipper_textformfield_showdialogs_f18assignment/textFormFields.dart/name.dart';
import 'package:clipper_textformfield_showdialogs_f18assignment/textFormFields.dart/number.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({super.key});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  var emailController = TextEditingController();
  var emailFormKey = GlobalKey<FormState>();
  var emailFocusNode = FocusNode();
  var emailValidContext = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

  var nameController = TextEditingController();
  var nameFormKey = GlobalKey<FormState>();
  var nameFocusNode = FocusNode();

  var numberController = TextEditingController();
  var numberFormKey = GlobalKey<FormState>();
  var numberFocusNode = FocusNode();

  var passwordController = TextEditingController();
  var passwordFormKey = GlobalKey<FormState>();
  var passwordFocusNode = FocusNode();

  var saveButtonFocusNode = FocusNode();
  var clearButtonFocusNode = FocusNode();

  var isEmailKeyTrue = false;
  var isPasswordKeyTrue = false;
  var isNameKeyTrue = false;
  var isNumberKeyTrue = false;

  void loginButtonAction() {
    setState(() {
      emailFormKey.currentState?.validate();

      passwordFormKey.currentState?.validate();

      numberFormKey.currentState?.validate();

      nameFormKey.currentState?.validate();
    });

    if (isEmailKeyTrue == true &&
        isNameKeyTrue == true &&
        isNumberKeyTrue == true &&
        isPasswordKeyTrue == true) {
      loginButtonDialog(context: context);
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
      });
    } else {
      elseLoginButtonDialog(context: context);
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return ClipPath(
      clipper: ContainerClipper(),
      child: Container(
        height: mqSize.height * 0.85,
        width: mqSize.width,
        color: Colors.white.withOpacity(0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: mqSize.height * 0.1),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: mqSize.width * 0.16,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: mqSize.width * 0.8,
                          height: mqSize.height * 0.6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(child: myLoginText()),

                              // -----------------------------Email------------------------------------------------
                              Flexible(
                                child: EnterYourEmail(
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(nameFocusNode);
                                  },
                                  validator: (value) {
                                    if (emailController.text.isEmpty) {
                                      isEmailKeyTrue = false;
                                      return 'Email should not be empty';
                                    } else if (!RegExp(emailValidContext)
                                        .hasMatch(emailController.text)) {
                                      isEmailKeyTrue = false;
                                      return 'Email context is invalid';
                                    }
                                    isEmailKeyTrue = true;
                                    return null;
                                  },
                                  focusNode: emailFocusNode,
                                  controller: emailController,
                                  formKey: emailFormKey,
                                ),
                              ),

                              // ----------------------------Name-------------------------
                              Flexible(
                                child: EnterYourName(
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(numberFocusNode);
                                  },
                                  controller: nameController,
                                  formKey: nameFormKey,
                                  focusNode: nameFocusNode,
                                  validator: (value) {
                                    if (nameController.text.isEmpty) {
                                      isNameKeyTrue = false;
                                      return 'Name should not be empty';
                                    } else if (!RegExp('[A-Z]')
                                        .hasMatch(nameController.text)) {
                                      isNameKeyTrue = false;
                                      return 'Name should have upper case';
                                    } else if (!RegExp('[a-z]')
                                        .hasMatch(nameController.text)) {
                                      isNameKeyTrue = false;
                                      return 'Name should have lower case';
                                    } else if (!RegExp('[ ]')
                                        .hasMatch(nameController.text)) {
                                      isNameKeyTrue = false;
                                      return 'Name should have spaces';
                                    } else if (nameController.text.length <=
                                        10) {
                                      isNameKeyTrue = false;
                                      return 'Name should be greater than 7 words';
                                    }
                                    isNameKeyTrue = true;
                                    return null;
                                  },
                                ),
                              ),

                              // --------------------------------Number----------------------------
                              Flexible(
                                child: EnterYourNumber(
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(passwordFocusNode);
                                  },
                                  controller: numberController,
                                  focusNode: numberFocusNode,
                                  formKey: numberFormKey,
                                  validator: (value) {
                                    if (numberController.text.isEmpty) {
                                      isNumberKeyTrue = false;
                                      return 'Number should not be empty';
                                    } else if (!RegExp('[0]')
                                        .hasMatch(numberController.text)) {
                                      isNumberKeyTrue = false;
                                      return 'Number should start from 0';
                                    } else if (value!.length < 11) {
                                      isNumberKeyTrue = false;
                                      return 'Number should be of 11 digits';
                                    } else if (value.length >= 12) {
                                      isNumberKeyTrue = false;
                                      return 'Number should be greater than 11 digits';
                                    } else {
                                      isNumberKeyTrue = true;
                                      return null;
                                    }
                                  },
                                ),
                              ),

                              // ---------------------------Password--------------------------
                              Flexible(
                                child: EnterYourPassword(
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(saveButtonFocusNode);
                                  },
                                  controller: passwordController,
                                  formKey: passwordFormKey,
                                  focusNode: passwordFocusNode,
                                  validator: (value) {
                                    if (passwordController.text.isEmpty) {
                                      isPasswordKeyTrue = false;
                                      return 'Password should not be empty';
                                    } else if (!RegExp('[A-Z]')
                                        .hasMatch(passwordController.text)) {
                                      isPasswordKeyTrue = false;
                                      return 'Password should have upper case';
                                    } else if (!RegExp('[a-z]')
                                        .hasMatch(passwordController.text)) {
                                      isPasswordKeyTrue = false;
                                      return 'Password should have lower case';
                                    } else if (!RegExp('[ ]')
                                        .hasMatch(passwordController.text)) {
                                      isPasswordKeyTrue = false;
                                      return 'Password should have spaces';
                                    } else if (passwordController.text.length <
                                        13) {
                                      isPasswordKeyTrue = false;
                                      return 'Password should be in 13 digits';
                                    } else {
                                      isPasswordKeyTrue = true;
                                      return null;
                                    }
                                  },
                                ),
                              ),

                              Flexible(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // -----------------Login Button-----------------

                                    SizedBox(
                                      height: mqSize.height * 0.05,
                                      width: mqSize.width * 0.2,
                                      child: ElevatedButton(
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                      Colors.brown)),
                                          focusNode: saveButtonFocusNode,
                                          onPressed: loginButtonAction,
                                          child: const FittedBox(
                                            child: Text('Login',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15)),
                                          )),
                                    ),

                                    // ----------------------------Clear button---------------------------

                                    SizedBox(
                                      height: mqSize.height * 0.05,
                                      width: mqSize.width * 0.2,
                                      child: ElevatedButton(
                                          focusNode: clearButtonFocusNode,
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                      Colors.brown)),
                                          onPressed: () {
                                            setState(() {
                                              if (emailController
                                                      .text.isNotEmpty ||
                                                  numberController
                                                      .text.isNotEmpty ||
                                                  nameController
                                                      .text.isNotEmpty ||
                                                  passwordController
                                                      .text.isNotEmpty) {
                                                emailController.clear();
                                                passwordController.clear();
                                                nameController.clear();
                                                numberController.clear();
                                                clearButton(context: context);
                                                Timer(
                                                  const Duration(seconds: 2),
                                                  () {
                                                    Navigator.of(context).pop();
                                                  },
                                                );
                                              }
                                            });
                                          },
                                          child: const FittedBox(
                                            child: Text(
                                              'Clear',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget myLoginText() {
  return const FittedBox(
    child: Text(
      'Login',
      style: TextStyle(
          fontSize: 30,
          color: Colors.brown,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),
    ),
  );
}
