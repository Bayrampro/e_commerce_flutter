import 'package:e_commerce/features/api/models/models.dart';
import 'package:flutter/material.dart';

class DetailGrid extends StatelessWidget {
  const DetailGrid({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.38,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Image.network(
          product.images[index],
          fit: BoxFit.cover,
        );
      },
    );
  }
}
