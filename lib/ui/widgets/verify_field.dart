import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodeField extends StatelessWidget {
  const VerifyCodeField({
    super.key,
    required this.length,
    required this.fieldHeight,
    required this.fieldWidth,
    required this.controller,
  });

  final int length;
  final double fieldHeight;
  final double fieldWidth;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PinCodeTextField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Введите число';
        }
        return null;
      },
      textStyle: theme.textTheme.titleLarge!.copyWith(color: Colors.black),
      autoFocus: true,
      controller: controller,
      length: length,
      appContext: context,
      animationType: AnimationType.fade,
      cursorColor: theme.primaryColor,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      pinTheme: PinTheme(
          activeColor: theme.primaryColor,
          selectedColor: theme.primaryColor,
          fieldHeight: fieldHeight,
          fieldWidth: fieldWidth,
          borderRadius: BorderRadius.circular(5),
          shape: PinCodeFieldShape.box,
          activeFillColor: theme.cardColor,
          selectedFillColor: theme.cardColor,
          inactiveFillColor: theme.cardColor,
          activeBoxShadow: [
            BoxShadow(blurRadius: 18.0, color: theme.cardColor)
          ]),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
    );
  }
}
