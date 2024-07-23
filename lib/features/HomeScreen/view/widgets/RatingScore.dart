import 'package:flutter/material.dart';

class RatingScore extends StatelessWidget {
  const RatingScore({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      child: Row(
        children: [
          Text(
            '$rating',
            style: mediaQuery.size.width > 860
                ? theme.textTheme.titleLarge
                : theme.textTheme.titleLarge?.copyWith(fontSize: 11),
          ),
          Icon(
            Icons.star,
            color: theme.cardColor,
          ),
        ],
      ),
    );
  }
}
