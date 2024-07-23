part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  const CategoryLoaded({
    required this.categories,
  });

  final List<Category> categories;

  @override
  List<Object> get props => [categories];
}

final class CategoryError extends CategoryState {
  const CategoryError({
    required this.error,
  });

  final Object error;

  @override
  List<Object> get props => [error];
}
