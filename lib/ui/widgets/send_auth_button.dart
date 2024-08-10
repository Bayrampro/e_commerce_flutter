import 'package:flutter/material.dart';

class SendAuthButton extends StatelessWidget {
  const SendAuthButton({
    super.key,
    required this.signUpAction,
  });

  final VoidCallback signUpAction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: signUpAction,
      child: const Text('Отправить'),
    );
  }
}
