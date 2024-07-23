part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class LoadSearchEvent extends SearchEvent {
  const LoadSearchEvent({
    required this.query,
  });

  final String query;

  @override
  List<Object> get props => [query];
}
