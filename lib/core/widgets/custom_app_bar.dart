import 'package:flutter/material.dart';

AppBar customAppBar({
  Widget? titleAppBar,
  Widget? leading,
  Color? backgroundColor,
  List<Widget>? actions,
  bool? automaticallyImplyLeading,
  bool? centerTitle,
  int? elevation,
  int? height,
}) {
  return AppBar(
    leading: leading,
    elevation: 0.0,
    centerTitle: centerTitle ?? true,
    backgroundColor: backgroundColor,
    title: titleAppBar,
    actions: actions,
    surfaceTintColor: Colors.transparent,
    automaticallyImplyLeading: automaticallyImplyLeading ?? false,
  );
}
