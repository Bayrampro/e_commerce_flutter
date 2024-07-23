import 'package:e_commerce/features/api/models/models.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class DetailCarouselAndGrid extends StatelessWidget {
  const DetailCarouselAndGrid({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    if (mediaQuery.size.width > 860) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Flexible(
              flex: 7,
              child: DetailCarousel(
                product: product,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 3,
              child: DetailGrid(
                product: product,
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            DetailCarousel(
              product: product,
            ),
            const SizedBox(
              height: 12,
            ),
            DetailGrid(
              product: product,
            ),
          ],
        ),
      );
    }
  }
}
