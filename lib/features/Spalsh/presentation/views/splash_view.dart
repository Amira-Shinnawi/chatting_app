import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SharedSpaces().responseSize(context);

    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
