import 'package:chatting_app/core/helpers/spacing.dart';
import 'package:chatting_app/core/theming/app_color.dart';
import 'package:chatting_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onTap, required this.buttonName});
  VoidCallback? onTap;
  String buttonName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(12)),
        width: double.infinity,
        height: SharedSpaces.verticalSpace * 6,
        child: Center(
            child: Text(
          buttonName,
          style: Styles.textStyle18.copyWith(
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
