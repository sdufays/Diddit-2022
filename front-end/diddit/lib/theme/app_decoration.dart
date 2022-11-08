import 'package:flutter/material.dart';
import 'package:diddit_final/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillOrange700 => BoxDecoration(
        color: ColorConstant.orange700,
      );
  static BoxDecoration get txtFillDeeporange100 => BoxDecoration(
        color: ColorConstant.deepOrange100,
      );
  static BoxDecoration get outlineDeeppurpleA100891 => BoxDecoration(
        color: ColorConstant.gray100,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.deepPurpleA10089,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillPurple50 => BoxDecoration(
        color: ColorConstant.purple50,
      );
  static BoxDecoration get outlineDeeppurpleA10089 => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.deepPurpleA10089,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder5 = BorderRadius.circular(
    getHorizontalSize(
      5.00,
    ),
  );

  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10.00,
    ),
  );

  static BorderRadius txtCircleBorder9 = BorderRadius.circular(
    getHorizontalSize(
      9.00,
    ),
  );
}
