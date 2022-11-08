import 'package:diddit_final/presentation/assignment_screen/assignment_screen.dart';
import 'package:diddit_final/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:diddit_final/presentation/upcoming_screen/upcoming_screen.dart';
import 'package:diddit_final/presentation/data_sync/TaskListAPI.dart';

import 'controller/register_controller.dart';
import 'package:diddit_final/core/app_export.dart';
import 'package:diddit_final/core/utils/validation_functions.dart';
import 'package:diddit_final/widgets/custom_button.dart';
import 'package:diddit_final/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterScreen extends GetWidget<RegisterController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  late String password = "";
  late String email = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 25,
                      top: 70,
                      right: 25,
                    ),
                    child: Text(
                      "lbl_welcome_onboard".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtWorkSansRomanRegular20,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 25,
                      top: 20,
                      right: 25,
                    ),
                    child: Text(
                      "msg_let_s_turn_your".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterRegular15,
                    ),
                  ),
                  CustomTextFormField(
                    width: 324,
                    focusNode: FocusNode(),
                    controller: RegisterController().textFieldController,
                    hintText: 'Enter Your Full Name:',
                    margin: getMargin(
                      left: 25,
                      top: 50,
                      right: 25,
                    ),
                  ),
                  CustomTextFormField(
                    width: 324,
                    focusNode: FocusNode(),
                    controller: RegisterController().textFieldOneController,
                    hintText: 'Enter Your Email:',
                    margin: getMargin(
                      left: 25,
                      top: 26,
                      right: 25,
                    ),
                    validator: (value) {
                      if (value == null ||
                          (!isValidEmail(value, isRequired: true))) {
                        return "Please enter valid email";
                      }
                      email = value;
                    },
                  ),
                  CustomTextFormField(
                    width: 324,
                    focusNode: FocusNode(),
                    controller: RegisterController().textFieldTwoController,
                    hintText: "msg_enter_your_pass".tr,
                    margin: getMargin(
                      left: 25,
                      top: 26,
                      right: 25,
                    ),
                    validator: (value) {
                      if (value == null ||
                          (!isValidPassword(value, isRequired: true))) {
                        return "Please enter valid password";
                      }
                      return null;
                    },
                    isObscureText: true,
                  ),
                  CustomTextFormField(
                    width: 324,
                    focusNode: FocusNode(),
                    controller: RegisterController().textFieldThreeController,
                    hintText: "msg_confirm_your_pa".tr,
                    margin: getMargin(
                      left: 25,
                      top: 26,
                      right: 25,
                    ),
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null ||
                          (!isValidPassword(value, isRequired: true))) {
                        return "Please enter valid password";
                      }
                      password = value;
                    },
                    isObscureText: true,
                  ),
                  CustomButton(
                    width: 325,
                    text: "lbl_register".tr,
                    margin: getMargin(
                      left: 25,
                      top: 63,
                      right: 25,
                    ),
                    variant: ButtonVariant.FillDeeppurpleA100,
                    shape: ButtonShape.Square,
                    padding: ButtonPadding.PaddingAll19,
                    fontStyle: ButtonFontStyle.WorkSansRomanSemiBold13,
                    onTap: () async {
                      email == "" || password == ""
                          ? print("null")
                          : await TaskListAPI.sendRegister(
                              email, password, context);
                    }, /*{
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpcomingScreen()),
                        );
                      }*/
                  ),
                  Container(
                    margin: getMargin(
                      left: 25,
                      top: 18,
                      right: 25,
                      bottom: 20,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "msg_already_have_an2".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                12,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                              text: "lbl_sign_in".tr,
                              style: TextStyle(
                                color: ColorConstant.purple800,
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignInScreen()))
                                    }),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

