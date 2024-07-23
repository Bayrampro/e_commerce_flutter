part of 'category_details_bloc.dart';

sealed class CategoryDetailsEvent extends Equatable {
  const CategoryDetailsEvent();

  @override
  List<Object> get props => [];
}

final class LoadCategoryDetailsEvent extends CategoryDetailsEvent {
  const LoadCategoryDetailsEvent({
    required this.slug,
  });

  final String slug;

  @override
  List<Object> get props => [slug];
}
