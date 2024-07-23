import 'package:flutter/material.dart';

import '../widgets.dart';

class ColCard extends StatelessWidget {
  const ColCard({
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NameAndCategory(
          imgUrl: imgUrl,
          name: name,
          category: category,
        ),
        const AddAndBuyButtons(),
      ],
    );
  }
}
