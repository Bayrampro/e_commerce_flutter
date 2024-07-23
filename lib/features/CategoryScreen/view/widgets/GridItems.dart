import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../HomeScreen/Home.dart';
import '../../bloc/category_details_bloc.dart';

class GridItems extends StatelessWidget {
  const GridItems({
    super.key,
    required this.state,
  });

  final CategoryDetailsLoaded state;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: mediaQuery.size.width > 600 ? 3 : 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: (1 / 0.6),
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final categoryProducts = state.categoryProducts;
            final product = categoryProducts[index];
            return GestureDetector(
              onTap: () => context.go('/details/${product.slug}'),
              child: GridTile(
                header: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RatingScore(
                        rating: product.rating,
                      ),
                    ],
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(product.images[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BottomDescription(
                    name: product.name,
                    category: product.category.name,
                    price: product.price,
                  ),
                ),
              ),
            );
          },
          childCount: state.categoryProducts.length,
        ),
      ),
    );
  }
}
