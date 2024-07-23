import 'package:flutter/material.dart';

class LocalizationButtons extends StatelessWidget {
  const LocalizationButtons({
    super.key,
    required this.color
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: color,
                  width: 2.0,
                ),
              ),
            ),
            child: TextButton(
              onPressed: () {  },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              ),
              child: Text(
                'RU',
                style: theme.textTheme.titleMedium?.copyWith(color: color),
              ),
            ),
          ),
          TextButton(
            onPressed: () {  },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
            ),
            child: Text(
              'EN',
              style: theme.textTheme.titleMedium?.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}