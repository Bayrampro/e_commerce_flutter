import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../repositories/auth_token/auth_token.dart';
import '../../../ui/ui.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/sign-in');
          },
          icon: Icon(
            Icons.arrow_back,
            color: theme.primaryColor,
          ),
        ),
      ),
      body: AuthContainer(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.question_mark_outlined,
              size: 50,
              color: theme.cardColor,
            ),
            Text(
              'Ваш никнейм',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge,
            ),
            AuthInput(
              controller: _usernameController,
              labelText: 'Ник',
            ),
            ElevatedButton(
              onPressed: () => _resetPasswordRequest(context),
              child: const Text('Отправить'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _resetPasswordRequest(BuildContext context) async {
    final authBloc = context.read<AuthBloc>();
    final completer = Completer();
    final username = _usernameController.text;
    authBloc.add(ResetPasswordRequest(
      completer,
      username: username,
    ));
    await completer.future;
    final authTokenRepository = context.read<AuthTokenInterface>();
    final isReset = authTokenRepository.isReset ?? false;
    if (isReset) {
      context.go('/password-reset/confirm/$username');
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
