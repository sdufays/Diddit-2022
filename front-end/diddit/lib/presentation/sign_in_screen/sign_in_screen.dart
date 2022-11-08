import 'package:diddit_final/presentation/register_screen/register_screen.dart';
import 'package:diddit_final/presentation/upcoming_screen/upcoming_screen.dart';

import 'controller/sign_in_controller.dart';
import 'package:diddit_final/core/app_export.dart';
import 'package:diddit_final/core/utils/validation_functions.dart';
import 'package:diddit_final/widgets/custom_button.dart';
import 'package:diddit_final/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:diddit_final/presentation/data_sync/TaskListAPI.dart';

class SignInScreen extends GetWidget<SignInController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                      left: 26,
                      top: 40,
                      right: 26,
                    ),
                    child: Text(
                      "lbl_welcome_back".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtWorkSansRomanRegular20,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 26,
                      top: 25,
                      right: 24,
                    ),
                    child: CommonImageView(
                      imagePath: ImageConstant.imgUndrawsignin,
                      height: getVerticalSize(
                        250.00,
                      ),
                      width: getHorizontalSize(
                        325.00,
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    width: 324,
                    focusNode: FocusNode(),
                    controller: SignInController().textFieldController,
                    hintText: "msg_enter_your_emai".tr,
                    margin: getMargin(
                      left: 26,
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
                    controller: SignInController().textFieldOneController,
                    hintText: "msg_enter_your_pass".tr,
                    margin: getMargin(
                      left: 26,
                      top: 25,
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
                  Padding(
                    padding: getPadding(
                      left: 26,
                      top: 19,
                      right: 26,
                    ),
                    child: Text(
                      "msg_forgot_password".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterRegular12Purple800,
                    ),
                  ),
                  CustomButton(
                    width: 325,
                    text: "lbl_sign_in2".tr,
                    margin: getMargin(
                      left: 26,
                      top: 55,
                      right: 24,
                    ),
                    variant: ButtonVariant.FillDeeppurpleA100,
                    shape: ButtonShape.Square,
                    padding: ButtonPadding.PaddingAll19,
                    fontStyle: ButtonFontStyle.WorkSansRomanSemiBold13,
                    onTap: () async {
                      email == "" || password == ""
                          ? print("null")
                          : await TaskListAPI.sendLogin(
                              email, password, context);
                    },
                  ),
                  Container(
                    margin: getMargin(
                      left: 26,
                      top: 14,
                      right: 26,
                      bottom: 20,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "msg_don_t_have_an_a2".tr,
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
                              text: "lbl_sign_up".tr,
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
                                                  RegisterScreen()))
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
