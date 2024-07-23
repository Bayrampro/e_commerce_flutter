import 'package:e_commerce/features/CategoryScreen/view/widgets/Error.dart';
import 'package:e_commerce/features/HomeScreen/bloc/products_bloc.dart';
import 'package:e_commerce/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdaptiveGrid extends StatefulWidget {
  const AdaptiveGrid({super.key});

  @override
  State<AdaptiveGrid> createState() => _AdaptiveGridState();
}

class _AdaptiveGridState extends State<AdaptiveGrid> {
  @override
  void initState() {
    BlocProvider.of<ProductsBloc>(context).add(LoadProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ProductsLoaded) {
          return GridItems(
            state: state,
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(
              child: StateErrorWidget(
                errorMessage: 'Упс...Что то пошло не так',
                onRetry: () {
                  BlocProvider.of<ProductsBloc>(context)
                      .add(LoadProductsEvent());
                },
              ),
            ),
          );
        }
      },
    );
  }
}
