import 'dart:async';
import 'package:e_commerce/repositories/auth_token/auth_token.dart';
import 'package:e_commerce/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: Icon(
            Icons.home,
            color: theme.primaryColor,
          ),
        ),
      ),
      body: AuthContainer(
        height: mediaQuery.size.width < 500 ? 320 : 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'logo.png',
              width: 80,
              height: 80,
            ),
            AuthInput(
              controller: _usernameController,
              labelText: 'Имя',
            ),
            AuthInput(
              controller: _passwordController,
              labelText: 'Пароль',
              obscureText: true,
            ),
            const SizedBox(height: 20),
            if (mediaQuery.size.width > 500)
              Column(
                children: [
                  RowAuthActions(
                    signUpAction: () => _signInAction(context),
                    authNavigation: () => context.go('/password-reset/request'),
                    authNavigationWord: 'Забыли пароль?',
                  )
                ],
              ),
            if (mediaQuery.size.width < 500)
              ColAuthActions(
                signUpAction: () => _signInAction(context),
                authNavigation: () => context.go('/password-reset/request'),
                authNavigationWord: 'Забыли пароль?',
              )
          ],
        ),
      ),
    );
  }

  Future<void> _signInAction(BuildContext context) async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final completer = Completer();
    context.read<AuthBloc>().add(
          SignInEvent(
            completer,
            username: username,
            password: password,
          ),
        );
    await completer.future;
    final authTokenRepository = context.read<AuthTokenInterface>();
    final isAuthenticated = authTokenRepository.isAuthenticated ?? false;
    if (isAuthenticated) {
      context.go('/');
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AuthErrorAlert();
        },
      );
    }
  }
}
