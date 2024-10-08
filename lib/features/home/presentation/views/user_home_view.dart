import 'package:chatting_app/core/theming/text_style.dart';
import 'package:chatting_app/core/widgets/custom_app_bar.dart';
import 'package:chatting_app/features/home/logic/users%20cubit/all_user_cubit.dart';
import 'package:chatting_app/features/home/presentation/views/widgets/user_home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        backgroundColor: Colors.white,
        titleAppBar: Text(
          'Chatting',
          style: Styles.textStyle32.copyWith(
            fontSize: 24,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: Colors.grey[100],
      body: BlocProvider(
        create: (context) => AllUserCubit(),
        child: const SafeArea(
          child: UserHomeBody(),
        ),
      ),
    );
  }
}
