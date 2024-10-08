import 'package:chatting_app/features/auth/logic/auth%20cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/login_page_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child:const SafeArea(
          child: LoginPageBody(),
        ),
      ),
    );
  }
}
