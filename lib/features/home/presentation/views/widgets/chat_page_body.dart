import 'dart:developer';

import 'package:chatting_app/core/widgets/chat_bubble.dart';
import 'package:chatting_app/features/home/data/models/message_model.dart';
import 'package:chatting_app/features/home/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_color.dart';
import '../../../../../core/theming/text_style.dart';
import '../../../../../core/utils/app_services.dart';
import '../../../../../core/widgets/chat_text_field.dart';

class ChatPageBody extends StatefulWidget {
  ChatPageBody({
    super.key,
    required this.email,
    required this.user,
  });
  final UserModel user;
  final String email;

  @override
  State<ChatPageBody> createState() => _ChatPageBodyState();
}

class _ChatPageBodyState extends State<ChatPageBody> {
  TextEditingController messageController = TextEditingController();

  final _controller = ScrollController();

  List<MessageModel> list = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder(
              stream: FirebaseServices.allMessages(widget.user),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const Center(child: CircularProgressIndicator());

                  case ConnectionState.active:
                  case ConnectionState.done:
                    final data = snapshot.data?.docs;
                    log('Snapshot Data: ${snapshot.data}');
                    list = data?.map((e) {
                          var messageData = e.data();
                          log('Message Data: $messageData');
                          return MessageModel.fromJson(messageData);
                        }).toList() ??
                        [];
                    log('Data: ${list.toString()}');
                    list.sort((a, b) {
                      return b.createdat!.compareTo(a.createdat!);
                    });
                    if (list.isNotEmpty) {
                      return ListView.builder(
                        reverse: false,
                        physics: const BouncingScrollPhysics(),
                        controller: _controller,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.all(SharedSpaces.verticalSpace * 1),
                            child: ChatBubble(
                              message: list[index],
                              isSender:
                                  list[index].id == FirebaseServices.user.uid
                                      ? false
                                      : true,
                              color: primaryColor,
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          'Say Hi',
                          style: Styles.textStyle32.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      );
                    }
                }
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ChatTextFeild(
            messageController: messageController,
            onPressed: () {
              if (messageController.text.isNotEmpty) {
                FirebaseServices.sendMessage(
                    widget.user, messageController.text, Timestamp.now());
                messageController.text = '';
              }
            },
          ),
        ),
      ],
    );
  }
}
