import '../controller/completed_controller.dart';
import '../models/completed_item_model.dart';
import 'package:diddit_final/core/app_export.dart';
import 'package:diddit_final/widgets/custom_button.dart';
import 'package:diddit_final/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompletedItemWidget extends StatelessWidget {
  CompletedItemWidget(this.completedItemModelObj);

  CompletedItemModel completedItemModelObj;

  var controller = Get.find<CompletedController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(
        top: 8.0,
        bottom: 8.0,
      ),
      decoration: AppDecoration.outlineDeeppurpleA100891.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: getPadding(
                left: 14,
                top: 10,
                right: 14,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 1,
                      bottom: 3,
                    ),
                    child: Text(
                      "lbl_class_name".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterLight10,
                    ),
                  ),
                  CustomIconButton(
                    height: 15,
                    width: 15,
                    variant: IconButtonVariant.FillDeeppurpleA101,
                    child: CommonImageView(
                      svgPath: ImageConstant.imgCheckmark15X15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 14,
              top: 5,
              right: 14,
            ),
            child: Text(
              "lbl_assignment_name".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular12,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: getPadding(
                left: 14,
                top: 9,
                right: 14,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomButton(
                    width: 47,
                    text: "lbl_hard".tr,
                    variant: ButtonVariant.FillDeeporange100,
                    fontStyle: ButtonFontStyle.InterSemiBold10,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 3,
                      bottom: 2,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 1,
                          ),
                          child: CommonImageView(
                            svgPath: ImageConstant.imgPlay,
                            height: getSize(
                              12.00,
                            ),
                            width: getSize(
                              12.00,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 7,
                            bottom: 1,
                          ),
                          child: Text(
                            "lbl_7_00am".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
