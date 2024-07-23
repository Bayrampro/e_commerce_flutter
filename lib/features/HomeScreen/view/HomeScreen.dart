import 'package:e_commerce/ui/ui.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          NavBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: HeadLine(
                headTitle: 'Хиты продаж',
                smallTitle: 'Смотреть все',
              ),
            ),
          ),
          AdaptiveGrid(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: HeadLine(
                headTitle: 'Лучшие новинки',
                smallTitle: 'Смотреть все',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ProductsCarousel(),
          )
        ],
      ),
    );
  }
}
