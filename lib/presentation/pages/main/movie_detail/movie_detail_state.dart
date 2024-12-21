import 'package:tentwenty_assessment/domain/entities/movie.dart';

class MovieDetailState {
  final bool loading;
  final Movie movie;

  const MovieDetailState({
    required this.loading,
    required this.movie,
  });

  factory MovieDetailState.initial() => MovieDetailState(
        loading: false,
        movie: Movie.shimmer(),
      );

  MovieDetailState copyWith({bool? loading, Movie? movie}) => MovieDetailState(
        loading: loading ?? this.loading,
        movie: movie ?? this.movie,
      );
}
