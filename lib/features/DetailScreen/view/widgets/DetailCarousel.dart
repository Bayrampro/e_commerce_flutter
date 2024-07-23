import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/features/api/models/models.dart';
import 'package:flutter/material.dart';

class DetailCarousel extends StatelessWidget {
  DetailCarousel({
    super.key,
    required this.product,
  });

  final Product product;

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double? carouselHeight = 500;
    double? viewportFraction = 0.8;
    if (mediaQuery.size.width < 1250) {
      carouselHeight = 400;
    }
    if (mediaQuery.size.width < 1150) {
      carouselHeight = 350;
      viewportFraction = 0.75;
    }
    if (mediaQuery.size.width < 1050) {
      carouselHeight = 300;
      viewportFraction = 0.75;
    }
    if (mediaQuery.size.width < 950) {
      carouselHeight = 280;
      viewportFraction = 0.75;
    }
    if (mediaQuery.size.width < 621) {
      carouselHeight = 200;
      viewportFraction = 0.7;
    }
    if (mediaQuery.size.width < 450) {
      carouselHeight = 150;
      viewportFraction = 0.65;
    }

    return Stack(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          items: product.images
              .map(
                (item) => Image.network(item, fit: BoxFit.cover),
              )
              .toList(),
          options: CarouselOptions(
            height: carouselHeight,
            viewportFraction: viewportFraction,
          ),
        ),
        Positioned(
          left: 5,
          top: carouselHeight * 0.5,
          child: IconButton(
            color: Theme.of(context).primaryColor,
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).cardColor,
            ),
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _carouselController.previousPage();
            },
          ),
        ),
        Positioned(
          right: 5,
          top: carouselHeight * 0.5,
          child: IconButton(
            color: Theme.of(context).primaryColor,
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).cardColor,
            ),
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              _carouselController.nextPage();
            },
          ),
        ),
      ],
    );
  }
}
