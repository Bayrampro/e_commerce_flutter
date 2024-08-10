import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.backgroundColor,
    this.borderSide,
    required this.iconData,
    required this.iconColor,
    required this.onPressed,
    required this.tooltip,
  });

  final Color backgroundColor, iconColor;
  final BorderSide? borderSide;
  final IconData iconData;
  final VoidCallback onPressed;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: borderSide,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      icon: Icon(
        iconData,
        color: iconColor,
      ),
    );
  }
}
