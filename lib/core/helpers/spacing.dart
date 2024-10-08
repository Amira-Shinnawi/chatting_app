import 'package:flutter/widgets.dart';

class SharedSpaces {
  static late MediaQueryData _mediaQueryData;

  static late double screenWidth;
  static late double screenHeight;
  static late double horizontalSpace;
  static late double verticalSpace;

  void responseSize(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    horizontalSpace = screenWidth / 100;
    verticalSpace = screenHeight / 100;
  }
}