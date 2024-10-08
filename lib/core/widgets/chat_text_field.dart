import 'package:chatting_app/core/theming/app_color.dart';
import 'package:flutter/material.dart';

class ChatTextFeild extends StatelessWidget {
  const ChatTextFeild({
    super.key,
    required this.messageController,
    this.onPressed,
  });
  final TextEditingController messageController;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: messageController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: 'Send Message',
        suffixIcon: IconButton(
            icon: Icon(
              Icons.send,
              color: primaryColor,
            ),
            onPressed: onPressed),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
