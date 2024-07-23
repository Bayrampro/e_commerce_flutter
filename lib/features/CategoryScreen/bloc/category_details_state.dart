part of 'category_details_bloc.dart';

sealed class CategoryDetailsState extends Equatable {
  const CategoryDetailsState();

  @override
  List<Object> get props => [];
}

final class CategoryDetailsInitial extends CategoryDetailsState {}

final class CategoryDetailsLoading extends CategoryDetailsState {}

final class CategoryDetailsLoaded extends CategoryDetailsState {
  const CategoryDetailsLoaded({
    required this.categoryProducts,
  });

  final List<Product> categoryProducts;

  @override
  List<Object> get props => [categoryProducts];
}

final class CategoryDetailsError extends CategoryDetailsState {
  const CategoryDetailsError({
    required this.error,
  });

  final Object error;

  @override
  List<Object> get props => [error];
}
