import 'package:flutter/material.dart';

class DetailRating extends StatelessWidget {
  const DetailRating({
    super.key,
    required this.rating,
    required this.crossAxisAlignment,
    required this.mainAxisAlignment,
    required this.color,
  });

  final double rating;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final int fullStars = rating.floor();
    final bool hasHalfStar = (rating - fullStars) >= 0.5;
    final int emptyStars = 5 - (fullStars + (hasHalfStar ? 1 : 0));

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          'Общий рейтинг',
          style: TextStyle(color: color),
        ),
        Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            for (int i = 0; i < fullStars; i++)
              const Icon(
                Icons.star,
                size: 30,
                color: Colors.yellow,
              ),
            if (hasHalfStar)
              const Icon(
                Icons.star_half,
                size: 30,
                color: Colors.yellow,
              ),
            for (int i = 0; i < emptyStars; i++)
              const Icon(
                Icons.star_border,
                size: 30,
                color: Colors.yellow,
              ),
          ],
        ),
        Text(
          '$rating',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color),
        ),
      ],
    );
  }
}
