part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

final class LoadProductDetailEvent extends ProductDetailEvent {
  const LoadProductDetailEvent({
    required this.slug,
  });

  final String slug;

  @override
  List<Object> get props => [slug];
}
