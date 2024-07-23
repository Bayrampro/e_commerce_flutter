import 'dart:developer';

import 'package:e_commerce/features/api/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api/models/models.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc({required this.productsApiClient})
      : super(ProductDetailInitial()) {
    on<LoadProductDetailEvent>(_onLoadProductDetails);
  }

  final ProductsApiClient productsApiClient;

  Future<void> _onLoadProductDetails(
      LoadProductDetailEvent event, Emitter<ProductDetailState> emit) async {
    emit(ProductDetailLoading());
    try {
      final product = await productsApiClient.getProductsDetails(event.slug);
      emit(ProductDetailLoaded(product: product));
    } catch (error) {
      log(error.toString());
      emit(ProductDetailError(error: error));
    }
  }
}
