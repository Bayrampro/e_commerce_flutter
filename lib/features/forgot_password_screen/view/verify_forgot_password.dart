// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../repositories/auth_token/auth_token.dart';
import '../../../ui/ui.dart';

class VerifyForgotPassword extends StatelessWidget {
  VerifyForgotPassword({
    super.key,
    required this.username,
  });

  final String username;

  final TextEditingController _verifyCodeController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/password-reset/request');
          },
          icon: Icon(
            Icons.arrow_back,
            color: theme.primaryColor,
          ),
        ),
      ),
      body: VerifyCodeForm(
        verifyAction: () => verifyResetAction(context),
        verifyCodeController: _verifyCodeController,
        newPasswordField: AuthInput(
          controller: _newPasswordController,
          labelText: 'Новый пароль',
          obscureText: true,
        ),
      ),
    );
  }

  Future<void> verifyResetAction(BuildContext context) async {
    final authBloc = context.read<AuthBloc>();
    final int verifyCode = int.parse(_verifyCodeController.text);
    final newPassword = _newPasswordController.text;
    final completer = Completer();
    authBloc.add(ResetPasswordConfirm(
      completer,
      username: username,
      code: verifyCode,
      newPassword: newPassword,
    ));
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
