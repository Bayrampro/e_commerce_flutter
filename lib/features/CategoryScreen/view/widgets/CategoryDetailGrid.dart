import 'package:e_commerce/features/CategoryScreen/bloc/category_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets.dart';

class CategoryDetailGrid extends StatefulWidget {
  const CategoryDetailGrid({
    super.key,
    required this.slug,
  });

  final String slug;

  @override
  State<CategoryDetailGrid> createState() => _CategoryDetailGridState();
}

class _CategoryDetailGridState extends State<CategoryDetailGrid> {
  @override
  void initState() {
    BlocProvider.of<CategoryDetailsBloc>(context)
        .add(LoadCategoryDetailsEvent(slug: widget.slug));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsBloc, CategoryDetailsState>(
      builder: (context, state) {
        if (state is CategoryDetailsLoading) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state is CategoryDetailsLoaded) {
          return GridItems(
            state: state,
          );
        } else {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: StateErrorWidget(
                  errorMessage: 'Упс...Что то пошло не так',
                  onRetry: () {
                    BlocProvider.of<CategoryDetailsBloc>(context)
                        .add(LoadCategoryDetailsEvent(slug: widget.slug));
                  },
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
