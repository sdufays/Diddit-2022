import '/core/app_export.dart';
import 'package:diddit_final/presentation/sign_in_screen/models/sign_in_model.dart';
import 'package:flutter/material.dart';

class SignInController extends GetxController {
  TextEditingController textFieldController = TextEditingController();

  TextEditingController textFieldOneController = TextEditingController();

  Rx<SignInModel> signInModelObj = SignInModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    textFieldController.dispose();
    textFieldOneController.dispose();
  }
}
