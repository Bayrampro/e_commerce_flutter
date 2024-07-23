import 'dart:developer';

import 'package:e_commerce/features/api/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../features/api/api.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required this.productsApiClient}) : super(CategoryInitial()) {
    on<LoadCategoryEvent>(_onLoadCategories);
  }

  final ProductsApiClient productsApiClient;

  Future<void> _onLoadCategories(
      LoadCategoryEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final categories = await productsApiClient.getCategories();
      emit(CategoryLoaded(categories: categories));
    } catch (error) {
      log(error.toString());
      emit(CategoryError(error: error));
    }
  }
}
