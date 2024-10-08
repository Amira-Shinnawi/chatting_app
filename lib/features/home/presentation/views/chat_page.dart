import 'package:chatting_app/core/theming/app_color.dart';
import 'package:chatting_app/core/theming/text_style.dart';
import 'package:chatting_app/core/widgets/custom_app_bar.dart';
import 'package:chatting_app/features/home/presentation/views/widgets/chat_page_body.dart';
import 'package:flutter/material.dart';

import '../../data/models/user_model.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
    required this.name,
    required this.email,
    required this.user,
  });
  final String name;
  final String email;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 24,
            color: Colors.white,
          ),
        ),
        titleAppBar: Text(
          name,
          style: Styles.textStyle18.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: ChatPageBody(
          email: email,
          user: user,
        ),
      ),
    );
  }
}
