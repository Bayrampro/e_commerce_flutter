import 'package:flutter/material.dart';

class ShopBasket extends StatelessWidget {
  const ShopBasket({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton.icon(
      onPressed: (){},
      label: Text(
        '0',
        style: theme.textTheme.titleMedium,
      ),
      icon: Icon(Icons.shopping_basket_outlined, color: theme.canvasColor,),
    );
  }
}