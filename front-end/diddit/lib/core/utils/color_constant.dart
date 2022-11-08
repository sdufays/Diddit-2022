import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray600 = fromHex('#757677');

  static Color red900 = fromHex('#b10808');

  static Color redA200 = fromHex('#fc5252');

  static Color lime800 = fromHex('#b18208');

  static Color amber100 = fromHex('#ffefb8');

  static Color orange700 = fromHex('#cd9300');

  static Color deepPurpleA10089 = fromHex('#89c79cff');

  static Color gray200 = fromHex('#eeeeee');

  static Color green700 = fromHex('#34b108');

  static Color greenA100 = fromHex('#c6ffb8');

  static Color gray100 = fromHex('#f5f5f5');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color deepPurpleA100 = fromHex('#bb64ff');

  static Color purple800 = fromHex('#6909b5');

  static Color deepPurpleA101 = fromHex('#946fff');

  static Color deepPurpleA200 = fromHex('#a259ff');

  static Color black90019 = fromHex('#19000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color purple50 = fromHex('#f2d6ff');

  static Color deepOrange100 = fromHex('#ffc7c7');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
