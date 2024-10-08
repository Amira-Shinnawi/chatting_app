import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:chatting_app/core/theming/app_color.dart';
import 'package:flutter/material.dart';

import '../../features/home/data/models/message_model.dart';
import '../helpers/function/formate_time.dart';

class ChatBubble extends StatefulWidget {
  ChatBubble({
    super.key,
    required this.message,
    required this.isSender,
    required this.color,
  });
  final MessageModel message;

  bool isSender;
  Color color;

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    String time = widget.message.createdat != null
        ? formatTimestamp(widget.message.createdat!)
        : "No time";
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 16),
          child: BubbleNormal(
            text: widget.message.message ?? '',
            isSender: widget.isSender,
            color: widget.isSender ? primaryColor : Colors.grey,
            tail: true,
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          time,
        ),
      ],
    );
  }
}
