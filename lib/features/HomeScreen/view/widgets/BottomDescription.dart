import 'package:flutter/material.dart';

class BottomDescription extends StatelessWidget {
  const BottomDescription({
    super.key,
    required this.name,
    required this.category,
    required this.price,
  });

  final String name;
  final String category;
  final String price;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    double? fontSizeForTitleLarge = 25.0;
    double? fontSizeForTitleMedium = 19.0;
    if (mediaQuery.size.width < 860 && mediaQuery.size.width > 350) {
      fontSizeForTitleLarge = 18.0;
      fontSizeForTitleMedium = 14.0;
    }
    if (mediaQuery.size.width < 444) {
      fontSizeForTitleLarge = 12.0;
      fontSizeForTitleMedium = 8.0;
    }
    if (mediaQuery.size.width < 261) {
      fontSizeForTitleLarge = 8.0;
      fontSizeForTitleMedium = 4.0;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: theme.primaryColor.withOpacity(0.7),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontSize: fontSizeForTitleLarge),
                ),
                const SizedBox(height: 4),
                Text(
                  category,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontSize: fontSizeForTitleMedium),
                ),
                const SizedBox(height: 4),
                Text(
                  '$price ₽',
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontSize: fontSizeForTitleMedium),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
