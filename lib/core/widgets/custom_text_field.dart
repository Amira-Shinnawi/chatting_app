import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.onChanged,
      this.hintText,
      this.pass = false,
      this.suffixIcon,this.controller});
  Function(String) onChanged;
  String? hintText;
  bool? pass;
  Widget? suffixIcon;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: pass!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      style: const TextStyle(color: Colors.black),
      onChanged: onChanged,
      controller:controller ,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: '$hintText',
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: builtOutlineInputBorder(),
        border: builtOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder builtOutlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    );
  }
}
