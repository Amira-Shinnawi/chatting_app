import 'package:chatting_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/function/formate_time.dart';
import '../../../data/models/user_model.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.firstCharacter,
    required this.user,
  });
  final UserModel user;
  final String firstCharacter;

  @override
  Widget build(BuildContext context) {
    String time =
        user.createdat != null ? formatTimestamp(user.createdat!) : "No time";

    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: SharedSpaces.horizontalSpace * .04,
          vertical: SharedSpaces.verticalSpace * .1),
      elevation: .5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: InkWell(
        child: ListTile(
          leading: CircleAvatar(
            child: Text(
              firstCharacter,
            ),
          ),
          title: Text(
            user.name!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            user.email!,
            maxLines: 1,
          ),
          trailing: Text(
            time,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
