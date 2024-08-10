import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthInput extends StatefulWidget {
  const AuthInput({
    super.key,
    required TextEditingController controller,
    required this.labelText,
    this.obscureText,
    this.inputFormatters,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String labelText;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<AuthInput> createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInput> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.canvasColor,
        borderRadius: BorderRadius.circular(7),
      ),
      margin: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              inputFormatters: widget.inputFormatters,
              controller: widget._controller,
              obscureText: widget.obscureText ?? false ? isObscure : false,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: widget.labelText,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          if (widget.obscureText != null)
            IconButton(
              icon: Icon(isObscure
                  ? Icons.remove_red_eye_outlined
                  : Icons.no_encryption_rounded),
              onPressed: () => _setObscure(isObscure),
            ),
        ],
      ),
    );
  }

  void _setObscure(bool value) {
    setState(() {
      value ? isObscure = false : isObscure = true;
    });
  }
}
