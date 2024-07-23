import 'package:flutter/material.dart';

import '../../../../ui/ui.dart';
import '../widgets.dart';

class DetailDescriptionAndRating extends StatelessWidget {
  const DetailDescriptionAndRating({
    super.key,
    required this.description,
    required this.rating,
  });

  final String description;
  final double rating;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    if (mediaQuery.size.width > 600) {
      return Row(
        children: [
          Flexible(
            flex: 7,
            child: DetailDescription(
              description: description,
            ),
          ),
          Flexible(
            flex: 3,
            child: DetailRating(
              rating: rating,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              color: Colors.black,
            ),
          )
        ],
      );
    } else {
      return Column(
        children: [
          DetailRating(
            rating: rating,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            color: Colors.black,
          ),
          DetailDescription(
            description: description,
          ),
        ],
      );
    }
  }
}
