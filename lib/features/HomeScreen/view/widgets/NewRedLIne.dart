import 'package:flutter/material.dart';

class NewRedLine extends StatelessWidget {
  const NewRedLine({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        'Новинка',
        style: mediaQuery.size.width > 361 ?
        theme.textTheme.titleMedium :
        theme.textTheme.titleMedium?.copyWith(fontSize: 8),
      ),
    );
  }
}