import 'package:flutter/material.dart';

class NameAndCategory extends StatelessWidget {
  const NameAndCategory({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.category,
  });

  final String imgUrl;
  final String name;
  final String category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    double? titleLargeFontSize = 23.0;
    double? titleMediumFontSize = 14.0;
    if (mediaQuery.size.width < 345) {
      titleLargeFontSize = 16.0;
      titleMediumFontSize = 10.0;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 75,
          height: 75,
          child: Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900, fontSize: titleLargeFontSize),
              ),
              Text(
                category,
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontSize: titleMediumFontSize),
              ),
            ],
          ),
        )
      ],
    );
  }
}
