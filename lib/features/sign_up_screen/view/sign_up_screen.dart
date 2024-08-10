import 'dart:async';

import 'package:e_commerce/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../repositories/auth_token/auth_token.dart';
import '../../../ui/ui.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();

  SignUpScreen({super.key});

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
        height: 450,
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
              controller: _emailController,
              labelText: 'Email',
            ),
            AuthInput(
              controller: _passwordController,
              labelText: 'Пароль',
              obscureText: true,
            ),
            AuthInput(
              controller: _password2Controller,
              labelText: 'Подтвердите пароль',
              obscureText: true,
            ),
            const SizedBox(height: 20),
            if (mediaQuery.size.width > 500)
              Column(
                children: [
                  RowAuthActions(
                    signUpAction: () => _signUpAction(context),
                    authNavigation: () => context.go('/sign-in'),
                    authNavigationWord: 'Уже есть аккаунт?',
                  )
                ],
              )
            else
              ColAuthActions(
                signUpAction: () => _signUpAction(context),
                authNavigation: () => context.go('/sign-in'),
                authNavigationWord: 'Уже есть аккаунт?',
              )
          ],
        ),
      ),
    );
  }

  Future<void> _signUpAction(BuildContext context) async {
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final password2 = _password2Controller.text;
    final completer = Completer();
    context.read<AuthBloc>().add(
          SignUpEvent(
            completer,
            username: username,
            email: email,
            password: password,
            password2: password2,
          ),
        );
    await completer.future;
    final authTokenRepository = context.read<AuthTokenInterface>();
    final isUserCreated = authTokenRepository.isUserCreated ?? false;
    print(isUserCreated);
    if (isUserCreated) {
      context.go('/verify/$username/$password');
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
