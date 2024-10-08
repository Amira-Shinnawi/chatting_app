import 'package:chatting_app/core/theming/app_color.dart';
import 'package:chatting_app/core/theming/text_style.dart';
import 'package:chatting_app/core/widgets/custom_button.dart';
import 'package:chatting_app/core/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/widgets/snack_bar.dart';
import '../../../logic/auth cubit/auth_cubit.dart';

class RegisterPageBody extends StatefulWidget {
  const RegisterPageBody({super.key});

  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is RegisterLoading) {
        isLoading = true;
      } else if (state is RegisterSuccess) {
        // // Navigator.push(
        // //     context, MaterialPageRoute(builder: (context) => MovieHome()));
        // GoRouter.of(context).push(AppRouter.kMainHome);

        isLoading = false;
      } else if (state is RegisterFailure) {
        showSnackBar(context, state.errorMessage);
        isLoading = false;
      }
    }, builder: (context, state) {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            isLoading = true;
          } else if (state is RegisterSuccess) {
            GoRouter.of(context).push(AppRouter.kUserHome);

            isLoading = false;
          } else if (state is RegisterFailure) {
            showSnackBar(context, state.errorMessage);
            isLoading = false;
          }
        },
        builder: (context, state) {
          return LoadingOverlay(
            isLoading: isLoading,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SharedSpaces.horizontalSpace * 4,
                vertical: SharedSpaces.verticalSpace * 4,
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
                        'Create your Account',
                        style: Styles.textStyle18.copyWith(
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: SharedSpaces.verticalSpace * 4,
                      ),
                      CustomTextField(
                        onChanged: (value) {},
                        controller: nameController,
                        hintText: 'User Name',
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
                        controller: passwordController,
                        hintText: 'Password',
                        pass: obscureText,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: obscureText ? Colors.black : primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SharedSpaces.verticalSpace * 4,
                      ),
                      CustomButton(
                        buttonName: 'Sign up',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).registerUser(
                              email: emailController.text,
                              password: passwordController.text,
                              userName: nameController.text,
                              createAt: Timestamp.now(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
