import 'package:e_commerce/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DropDownResponsiveMenu extends StatelessWidget {
  const DropDownResponsiveMenu({
    super.key,
    required this.showCategoryDialog,
  });

  final Function showCategoryDialog;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopupMenuButton<String>(
        icon: Icon(
          Icons.more_vert,
          color: theme.cardColor,
        ),
        color: theme.cardColor,
        itemBuilder: (context) => <PopupMenuEntry<String>>[
              PopupMenuItem(
                  value: 'podborki',
                  child: TextButton(
                    onPressed: () {
                      context.go('/');
                    },
                    child: const Text('Главная'),
                  )),
              PopupMenuItem(
                  child: TextButton(
                onPressed: () {
                  showCategoryDialog(context);
                },
                child: const Text('Категории'),
              )),
              PopupMenuItem(
                  child: TextButton(
                onPressed: () {},
                child: const Text('Корзина'),
              )),
              PopupMenuItem(
                  child: TextButton(
                onPressed: () {},
                child: const Text('Войти'),
              )),
              PopupMenuItem(
                  child: TextButton(
                onPressed: () {},
                child: const Text('Регистрация'),
              )),
              PopupMenuItem(
                  child: TextButton(
                onPressed: () {},
                child: LocalizationButtons(
                  color: theme.primaryColor,
                ),
              )),
            ]);
  }
}
