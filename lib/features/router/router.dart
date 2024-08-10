import 'package:e_commerce/features/forgot_password_screen/forgot_password.dart';
import 'package:go_router/go_router.dart';
import '../CategoryScreen/Category.dart';
import '../DetailScreen/Detail.dart';
import '../HomeScreen/Home.dart';
import '../SearchScreen/Search.dart';
import '../sign_in_screen/sign_in.dart';
import '../sign_up_screen/sign_up.dart';
import '../verify_email_screen/verify_email.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
        path: '/details/:slug',
        builder: (context, state) {
          final slug = state.pathParameters['slug']!;
          return DetailScreen(
            slug: slug,
          );
        }),
    GoRoute(
      path: '/category/:slug',
      builder: (context, state) {
        final slug = state.pathParameters['slug']!;
        return CategoryScreen(
          slug: slug,
        );
      },
    ),
    GoRoute(
      path: '/search/:query',
      builder: (context, state) {
        final query = state.pathParameters['query']!;
        return SearchScreen(
          query: query,
        );
      },
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: '/verify/:username/:password',
      builder: (context, state) {
        final username = state.pathParameters['username']!;
        final password = state.pathParameters['password']!;
        return VerifyEmailScreen(
          username: username,
          password: password,
        );
      },
    ),
    GoRoute(
      path: '/password-reset/request',
      builder: (context, state) => ForgotPasswordScreen(),
    ),
    GoRoute(
      path: '/password-reset/confirm/:username',
      builder: (context, state) {
        final username = state.pathParameters['username']!;
        return VerifyForgotPassword(
          username: username,
        );
      },
    ),
  ],
);
