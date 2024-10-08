import 'package:chatting_app/features/auth/logic/auth%20cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/register_page_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 24,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: const SafeArea(
              child: RegisterPageBody(),
            ),
      ),
    );
  }
}
