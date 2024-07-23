part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent extends Equatable {}

final class LoadProductsEvent extends ProductsEvent {
  @override
  List<Object?> get props => [];
}

final class LoadNewProductsEvent extends ProductsEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
