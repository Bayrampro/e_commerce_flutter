import 'dart:developer';

import 'package:e_commerce/features/api/api.dart';
import 'package:e_commerce/features/api/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({
    required this.productsApiClient,
  }) : super(ProductsInitial()) {
    on<LoadProductsEvent>(_onLoadProducts);
    on<LoadNewProductsEvent>(_onLoadProducts);
  }

  final ProductsApiClient productsApiClient;

  Future<void> _onLoadProducts(
      ProductsEvent event, Emitter<ProductsState> emit) async {
    emit(ProductsLoading());
    try {
      final products = await productsApiClient.getProducts();
      final newProducts = await productsApiClient.getNewProducts();
      emit(ProductsLoaded(products: products, newProducts: newProducts));
    } catch (error) {
      log(error.toString());
      emit(ProductsError(error: error));
    }
  }
}
