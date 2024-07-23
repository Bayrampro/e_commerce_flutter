import 'package:e_commerce/features/DetailScreen/bloc/product_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets.dart';
import '../../../ui/ui.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.slug,
  });

  final String slug;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductDetailBloc>(context)
        .add(LoadProductDetailEvent(slug: widget.slug));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductDetailError) {
            return Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: StateErrorWidget(
                  errorMessage: 'Упс...Что то пошло не так',
                  onRetry: () {
                    BlocProvider.of<ProductDetailBloc>(context)
                        .add(LoadProductDetailEvent(slug: widget.slug));
                  },
                ),
              ),
            );
          } else if (state is ProductDetailLoaded) {
            return CustomScrollView(
              slivers: [
                const NavBar(),
                SliverToBoxAdapter(
                  child: DetailBreadCrumb(
                    category: state.product.category.name,
                    name: state.product.name,
                  ),
                ),
                if (mediaQuery.size.width > 720)
                  SliverToBoxAdapter(
                    child: DetailCard(
                      height: 90.0,
                      child: RowCard(
                        imgUrl: state.product.images[0],
                        name: state.product.name,
                        category: state.product.category.name,
                      ),
                    ),
                  ),
                if (mediaQuery.size.width < 720)
                  SliverToBoxAdapter(
                      child: DetailCard(
                    height: 150.0,
                    child: ColCard(
                      imgUrl: state.product.images[0],
                      name: state.product.name,
                      category: state.product.category.name,
                    ),
                  )),
                SliverToBoxAdapter(
                  child: DetailCarouselAndGrid(
                    product: state.product,
                  ),
                ),
                SliverToBoxAdapter(
                  child: DetailDescriptionAndRating(
                    description: state.product.description,
                    rating: state.product.rating,
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
