import 'package:flutter/material.dart';

import '../ui.dart';

class ColAuthActions extends StatelessWidget {
  const ColAuthActions({
    super.key,
    required VoidCallback signUpAction,
    required this.authNavigation,
    required this.authNavigationWord,
  }) : _signUpAction = signUpAction;

  final VoidCallback _signUpAction;
  final VoidCallback authNavigation;
  final String authNavigationWord;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SendAuthButton(signUpAction: _signUpAction),
        const SizedBox(
          height: 8.0,
        ),
        AuthNavigationButton(
          authNavigation: authNavigation,
          authNavigationWord: authNavigationWord,
        ),
      ],
    );
  }
}
