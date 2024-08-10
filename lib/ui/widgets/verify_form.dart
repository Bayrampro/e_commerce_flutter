import 'package:e_commerce/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyCodeForm extends StatelessWidget {
  const VerifyCodeForm({
    super.key,
    required this.verifyCodeController,
    required this.verifyAction,
    this.newPasswordField,
  });

  final TextEditingController verifyCodeController;
  final VoidCallback verifyAction;
  final Widget? newPasswordField;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    return AuthContainer(
      height: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.message_outlined,
            size: 50,
            color: theme.cardColor,
          ),
          Text(
            'Двух этапная аутентификация',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 30,
          ),
          if (mediaQuery.size.width > 445)
            VerifyCodeField(
              length: 6,
              fieldHeight: mediaQuery.size.width > 750 ? 80 : 50,
              fieldWidth: mediaQuery.size.width > 750 ? 70 : 40,
              controller: verifyCodeController,
            ),
          if (mediaQuery.size.width < 445)
            AuthInput(
              controller: verifyCodeController,
              labelText: 'Введите код',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          newPasswordField ?? const SizedBox(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: verifyAction,
            child: const Text('Отправить'),
          )
        ],
      ),
    );
  }
}
