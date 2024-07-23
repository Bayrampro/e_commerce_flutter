import 'dart:developer';

import 'package:e_commerce/features/api/api.dart';
import 'package:e_commerce/features/api/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_details_event.dart';
part 'category_details_state.dart';

class CategoryDetailsBloc
    extends Bloc<CategoryDetailsEvent, CategoryDetailsState> {
  CategoryDetailsBloc({required this.productsApiClient})
      : super(CategoryDetailsInitial()) {
    on<LoadCategoryDetailsEvent>(_onLoadCategoryDetails);
  }

  final ProductsApiClient productsApiClient;

  Future<void> _onLoadCategoryDetails(LoadCategoryDetailsEvent event,
      Emitter<CategoryDetailsState> emit) async {
    emit(CategoryDetailsLoading());
    try {
      final categoryProducts =
          await productsApiClient.getCategoriesDetails(event.slug);
      emit(CategoryDetailsLoaded(categoryProducts: categoryProducts));
    } catch (error) {
      log(error.toString());
      emit(CategoryDetailsError(error: error));
    }
  }
}
