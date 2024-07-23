part of 'products_bloc.dart';

@immutable
sealed class ProductsState extends Equatable {}

final class ProductsInitial extends ProductsState {
  @override
  List<Object?> get props => [];
}

final class ProductsLoading extends ProductsState {
  @override
  List<Object?> get props => [];
}

final class ProductsLoaded extends ProductsState {
  ProductsLoaded({
    required this.products,
    required this.newProducts,
  });

  final List<Product> products;
  final List<Product> newProducts;

  @override
  List<Object?> get props => [products, newProducts];
}

final class ProductsError extends ProductsState {
  ProductsError({
    required this.error,
  });

  final Object error;

  @override
  List<Object?> get props => [error];
}
