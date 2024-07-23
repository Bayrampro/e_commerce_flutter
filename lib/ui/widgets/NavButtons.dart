import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavButtons extends StatelessWidget {
  const NavButtons({
    super.key,
    required this.showCategoryDialog,
  });

  final Function showCategoryDialog;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (mediaQuery.size.width > 980)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              onPressed: () {
                context.go('/');
              },
              child: Text(
                'Главная',
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
        if (mediaQuery.size.width > 980)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              onPressed: () {
                showCategoryDialog(context);
              },
              child: Text(
                'Категории',
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
      ],
    );
  }
}
