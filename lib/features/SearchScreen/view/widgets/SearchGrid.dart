import 'package:e_commerce/bloc/search_bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets.dart';

class SearchGrid extends StatefulWidget {
  const SearchGrid({
    super.key,
    required this.query,
  });

  final String query;

  @override
  State<SearchGrid> createState() => _SearchGridState();
}

class _SearchGridState extends State<SearchGrid> {
  @override
  void initState() {
    BlocProvider.of<SearchBloc>(context)
        .add(LoadSearchEvent(query: widget.query));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is! SearchLoaded) {
          return SliverToBoxAdapter(
            child: Container(),
          );
        }
        return SliverList.builder(
          itemBuilder: (context, index) {
            return ProductCard(
              product: state.products[index],
            );
          },
          itemCount: state.products.length,
        );
      },
    );
  }
}
