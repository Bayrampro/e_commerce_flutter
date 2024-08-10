import 'package:flutter/material.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({
    super.key,
    required this.child,
    required this.height,
  });

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          width: mediaQuery.size.width * 0.60,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: theme.primaryColor,
            boxShadow: [
              BoxShadow(
                color: theme.primaryColor,
                blurStyle: BlurStyle.solid,
                blurRadius: 40.0,
                spreadRadius: 10.0,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: child,
        ),
      ),
    );
  }
}
