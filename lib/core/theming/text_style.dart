import 'package:flutter/material.dart';

import 'app_color.dart';

abstract class Styles {
  static var textStyle32 = TextStyle(
    color: primaryColor,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static const textStyle18 = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
}
