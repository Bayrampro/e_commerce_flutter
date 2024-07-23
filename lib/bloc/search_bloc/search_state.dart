part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  const SearchLoaded({
    required this.products,
  });

  final List<Product> products;

  @override
  List<Object> get props => [products];
}

final class SearchError extends SearchState {
  const SearchError({
    required this.error,
  });

  final Object error;

  @override
  List<Object> get props => [error];
}
