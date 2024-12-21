import '../../../../domain/entities/movie.dart';

class DashboardState {
  final bool loading;
  final List<Movie> movies;

  const DashboardState({required this.loading, required this.movies});

  factory DashboardState.initial() => const DashboardState(
        loading: false,
        movies: [],
      );

  DashboardState copyWith({bool? loading, List<Movie>? movies}) =>
      DashboardState(
        loading: loading ?? this.loading,
        movies: movies ?? this.movies,
      );
}
