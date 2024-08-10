import 'package:flutter/material.dart';

import '../ui.dart';

class RowAuthActions extends StatelessWidget {
  const RowAuthActions({
    super.key,
    required this.signUpAction,
    required this.authNavigation,
    required this.authNavigationWord,
  });

  final VoidCallback signUpAction;
  final VoidCallback authNavigation;
  final String authNavigationWord;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SendAuthButton(signUpAction: signUpAction),
        AuthNavigationButton(
          authNavigation: authNavigation,
          authNavigationWord: authNavigationWord,
        ),
      ],
    );
  }
}
