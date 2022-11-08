import 'controller/splash_controller.dart';
import 'package:diddit_final/core/app_export.dart';
import 'package:diddit_final/widgets/custom_button.dart';
import 'package:diddit_final/presentation/register_screen/register_screen.dart';
import 'package:diddit_final/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      right: 10,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      left: 25,
                      top: 54,
                      right: 25,
                    ),
                    child: Text(
                      "lbl_diddit".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtWorkSansRomanRegular26,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: getPadding(
                      left: 79,
                      top: 18,
                      right: 79,
                    ),
                    child: CommonImageView(
                      svgPath: ImageConstant.imgIllustration,
                      height: getVerticalSize(
                        200.00,
                      ),
                      width: getHorizontalSize(
                        200.00,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      left: 25,
                      top: 25,
                      right: 25,
                    ),
                    child: Text(
                      "msg_for_students_b".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtWorkSansRomanRegular18,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: getHorizontalSize(
                      277.00,
                    ),
                    margin: getMargin(
                      left: 25,
                      top: 30,
                      right: 25,
                    ),
                    child: Text(
                      "msg_urna_tortor_l".tr,
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtInterRegular15,
                    ),
                  ),
                ),
                CustomButton(
                    width: 325,
                    text: "lbl_get_started".tr,
                    margin: getMargin(
                      left: 25,
                      top: 74,
                      right: 25,
                      bottom: 20,
                    ),
                    variant: ButtonVariant.FillDeeppurpleA100,
                    shape: ButtonShape.Square,
                    padding: ButtonPadding.PaddingAll19,
                    fontStyle: ButtonFontStyle.WorkSansRomanSemiBold13,
                    alignment: Alignment.center,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
