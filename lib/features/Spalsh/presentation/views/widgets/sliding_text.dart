import 'package:chatting_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.animation,
  });

  final Animation<Offset> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: ((context, child) {
        return SlideTransition(
          position: animation,
          child:  Text(
            'Chatting App',
            style:Styles.textStyle32 ,
          ),
        );
      }),
    );
  }
}