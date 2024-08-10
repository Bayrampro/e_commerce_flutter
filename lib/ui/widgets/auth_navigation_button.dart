import 'package:flutter/material.dart';

class AuthNavigationButton extends StatelessWidget {
  const AuthNavigationButton({
    super.key,
    required this.authNavigation,
    required this.authNavigationWord,
  });

  final VoidCallback authNavigation;
  final String authNavigationWord;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: authNavigation,
      style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: theme.cardColor,
            width: 2.0,
          ),
          padding: const EdgeInsets.all(14.0)),
      child: Text(
        authNavigationWord,
        style: theme.textTheme.titleMedium?.copyWith(fontSize: 15),
      ),
    );
  }
}
