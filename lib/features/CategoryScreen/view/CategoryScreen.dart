import 'package:e_commerce/ui/ui.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.slug,
  });

  final String slug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const NavBar(),
          CategoryDetailGrid(
            slug: slug,
          ),
        ],
      ),
    );
  }
}
