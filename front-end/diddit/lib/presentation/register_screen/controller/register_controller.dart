import '/core/app_export.dart';
import 'package:diddit_final/presentation/register_screen/models/register_model.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  TextEditingController textFieldController = TextEditingController();

  TextEditingController textFieldOneController = TextEditingController();

  TextEditingController textFieldTwoController = TextEditingController();

  TextEditingController textFieldThreeController = TextEditingController();

  Rx<RegisterModel> registerModelObj = RegisterModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    textFieldController.dispose();
    textFieldOneController.dispose();
    textFieldTwoController.dispose();
    textFieldThreeController.dispose();
  }
}
