import 'package:chatting_app/features/auth/presentation/views/login_page.dart';
import 'package:chatting_app/features/auth/presentation/views/register_page.dart';
import 'package:chatting_app/features/home/presentation/views/user_home_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/Spalsh/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kLoginPage = '/loginPage';
  static const kRegisterPage = '/registerPage';
  static const kChatHome = '/chatHome';
  static const kUserHome = '/userHome';
  static const kMainHome = '/mainHome';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginPage,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: kRegisterPage,
        builder: (context, state) => const RegisterPage(),
      ),
      // GoRoute(
      //   path: kChatHome,
      //   builder: (context, state) => const ChatHomeView(),
      // ),
      GoRoute(
        path: kUserHome,
        builder: (context, state) => const UserHomeView(),
      ),
      // GoRoute(
      //   path: kMainHome,
      //   builder: (context, state) => const MainHome(),
      // ),
    ],
  );
}
