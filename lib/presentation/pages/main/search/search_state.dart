import 'package:tentwenty_assessment/domain/entities/movie.dart';

class SearchState {
  final bool loading;
  final List<Movie> movies;

  const SearchState({required this.loading, required this.movies});

  factory SearchState.initial() => const SearchState(
        loading: false,
        movies: [],
      );

  SearchState copyWith({bool? loading, List<Movie>? movies}) => SearchState(
        loading: loading ?? this.loading,
        movies: movies ?? this.movies,
      );
}
