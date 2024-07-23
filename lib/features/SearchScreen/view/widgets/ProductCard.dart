import 'package:e_commerce/features/api/models/models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../ui/ui.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => context.go('/details/${product.slug}'),
      child: Container(
        width: screenWidth,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
              'bg-orange.jpg',
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.images[0],
              width: screenWidth * 0.3,
              height: screenWidth * 0.3,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    product.category.name,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    product.price,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10.0),
                  DetailRating(
                    rating: product.rating,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    color: theme.cardColor,
                  ),
                  SizedBox(height: screenWidth < 1000 ? 30.0 : 70.0),
                  Text(
                    product.description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () => context.go('/details/${product.slug}'),
                    child: const Text('Подробнее'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
