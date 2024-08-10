import 'dart:async';
import 'package:e_commerce/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../repositories/auth_token/auth_token.dart';
import '../../../ui/ui.dart';

class VerifyEmailScreen extends StatelessWidget {
  final TextEditingController _verifyCodeController = TextEditingController();

  VerifyEmailScreen({
    super.key,
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/sign-up');
          },
          icon: Icon(
            Icons.arrow_back,
            color: theme.primaryColor,
          ),
        ),
      ),
      body: VerifyCodeForm(
        verifyAction: () => verifyAction(context),
        verifyCodeController: _verifyCodeController,
      ),
    );
  }

  Future<void> verifyAction(BuildContext context) async {
    final authBloc = context.read<AuthBloc>();
    final int verifyCode = int.parse(_verifyCodeController.text);
    final completer = Completer();
    authBloc.add(VerifyEvent(
      completer,
      verifyCode: verifyCode,
      username: username,
      password: password,
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
