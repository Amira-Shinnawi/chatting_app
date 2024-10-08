import 'package:chatting_app/features/home/presentation/views/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/text_style.dart';
import '../../../logic/users cubit/all_user_cubit.dart';
import 'chat_item.dart';

class ChatItemsListView extends StatefulWidget {
  const ChatItemsListView({
    super.key,
  });

  @override
  State<ChatItemsListView> createState() => _ChatItemsListViewState();
}

class _ChatItemsListViewState extends State<ChatItemsListView> {
  @override
  Widget build(BuildContext context) {
    context.read<AllUserCubit>().fetchUsers();

    return BlocBuilder<AllUserCubit, AllUserState>(
      builder: (context, state) {
        if (state is FetchAllUser) {
          state.users.sort((a, b) {
            return b.createdat!.compareTo(a.createdat!);
          });
          if (state.users.isNotEmpty) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.users.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SharedSpaces.verticalSpace * 1,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(
                            name: state.users[index].name!,
                            email: state.users[index].email!,
                            user: state.users[index],
                          ),
                        ),
                      );
                    },
                    child: ChatItem(
                      user: state.users[index],
                      firstCharacter: state.users[index].name!.characters.first,
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'No Connection Found',
                style: Styles.textStyle32.copyWith(
                  fontSize: 20,
                ),
              ),
            );
          }
        } else if (state is AllUserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AllUserFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: Styles.textStyle32.copyWith(
                fontSize: 20,
              ),
            ),
          );
        }
        return const Center(child: Text('Something went wrong.'));
      },
    );
  }
}
