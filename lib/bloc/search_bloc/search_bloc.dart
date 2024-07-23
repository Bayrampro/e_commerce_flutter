import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/features/api/api.dart';
import 'package:equatable/equatable.dart';

import '../../features/api/models/models.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required this.productsApiClient,
  }) : super(SearchInitial()) {
    on<LoadSearchEvent>(_onLoadSearch);
  }

  final ProductsApiClient productsApiClient;

  Future<void> _onLoadSearch(
      LoadSearchEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final products = await productsApiClient.searchProducts(event.query);
      emit(SearchLoaded(products: products));
    } catch (error) {
      log(error.toString());
      emit(SearchError(error: error));
    }
  }
}
