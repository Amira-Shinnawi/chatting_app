import 'package:chatting_app/core/theming/app_color.dart';
import 'package:chatting_app/core/theming/text_style.dart';
import 'package:chatting_app/core/utils/app_router.dart';
import 'package:chatting_app/core/widgets/custom_button.dart';
import 'package:chatting_app/core/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/widgets/snack_bar.dart';
import '../../../logic/auth cubit/auth_cubit.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool obscureText = true;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          GoRouter.of(context).push(AppRouter.kUserHome);

          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errorMessage);
          isLoading = false;
        }
      },
      child: LoadingOverlay(
        isLoading: isLoading,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SharedSpaces.horizontalSpace * 4,
            vertical: SharedSpaces.verticalSpace * 14,
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 2 / .8,
                    child: Image.asset(
                      AssetsData.logo,
                    ),
                  ),
                  SizedBox(
                    height: SharedSpaces.verticalSpace * 6,
                  ),
                  Text(
                    'Login to your Account',
                    style: Styles.textStyle18.copyWith(
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: SharedSpaces.verticalSpace * 4,
                  ),
                  CustomTextField(
                    onChanged: (value) {},
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: SharedSpaces.verticalSpace * 4,
                  ),
                  CustomTextField(
                    onChanged: (value) {},
                    hintText: 'Password',
                    controller: passwordController,
                    pass: obscureText,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: obscureText ? Colors.black : primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SharedSpaces.verticalSpace * 4,
                  ),
                  CustomButton(
                    buttonName: 'Sign in',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).loginUser(
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    },
                  ),
                  SizedBox(
                    height: SharedSpaces.verticalSpace * 6,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: Styles.textStyle18.copyWith(
                            color: Colors.grey,
                          ),
                          children: [
                            TextSpan(
                              text: ' Sign up',
                              style: Styles.textStyle18.copyWith(
                                color: primaryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  GoRouter.of(context)
                                      .push(AppRouter.kRegisterPage);
                                },
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
