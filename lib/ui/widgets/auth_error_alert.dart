import 'package:flutter/material.dart';

class AuthErrorAlert extends StatelessWidget {
  const AuthErrorAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      icon: Icon(
        Icons.warning,
        color: Colors.red,
      ),
      title: Text(
        'Ошибка отправки',
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      content: Text('Проверьте интернет или заполните все поля верно!'),
    );
  }
}
