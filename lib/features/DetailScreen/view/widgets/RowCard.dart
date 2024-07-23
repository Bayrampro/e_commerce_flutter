import 'package:flutter/material.dart';

import '../widgets.dart';

class RowCard extends StatelessWidget {
  const RowCard({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NameAndCategory(
          imgUrl: imgUrl,
          category: category,
          name: name,
        ),
        const AddAndBuyButtons(),
      ],
    );
  }
}
