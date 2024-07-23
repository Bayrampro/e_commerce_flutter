part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

final class LoadCategoryEvent extends CategoryEvent {
  const LoadCategoryEvent();

  @override
  List<Object> get props => [];
}
