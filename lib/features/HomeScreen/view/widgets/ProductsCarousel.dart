import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/features/HomeScreen/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../widgets.dart';

class ProductsCarousel extends StatefulWidget {
  const ProductsCarousel({super.key});

  @override
  State<ProductsCarousel> createState() => _ProductsCarouselState();
}

class _ProductsCarouselState extends State<ProductsCarousel> {
  @override
  void initState() {
    BlocProvider.of<ProductsBloc>(context).add(LoadNewProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'bg-orange.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double screenWidth = MediaQuery.of(context).size.width;
          final double itemWidth = screenWidth * 0.8;
          return BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoaded) {
                final newProducts = state.newProducts;
                return CarouselSlider(
                    items: newProducts
                        .map((item) => GestureDetector(
                              onTap: () {
                                context.go('/details/${item.slug}');
                              },
                              child: Container(
                                width: itemWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        item.images[0],
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: RatingScore(
                                          rating: item.rating,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 10,
                                        left: 10,
                                        child: NewRedLine(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      height: screenWidth > 550 ? 300 : 200,
                      enlargeCenterPage: true,
                      viewportFraction: 0.4,
                    ));
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}
