import 'package:chatting_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

import 'chat_items_list_view.dart';


class UserHomeBody extends StatelessWidget {
  const UserHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SharedSpaces.verticalSpace * 2,
        horizontal: SharedSpaces.horizontalSpace * 4,
      ),
      child: const ChatItemsListView(),
    );
  }
}
