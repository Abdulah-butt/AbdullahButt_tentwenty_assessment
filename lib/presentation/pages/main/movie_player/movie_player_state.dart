import 'movie_player_initial_params.dart';

class MoviePlayerState {
final bool loading;
const MoviePlayerState({required this.loading});

factory MoviePlayerState.initial() => const MoviePlayerState(loading: false);

MoviePlayerState copyWith({bool? loading}) => MoviePlayerState(loading: loading??this.loading);
}
