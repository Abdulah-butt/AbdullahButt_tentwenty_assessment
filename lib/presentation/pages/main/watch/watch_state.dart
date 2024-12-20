import 'watch_initial_params.dart';

class WatchState {
final bool loading;
const WatchState({required this.loading});

factory WatchState.initial() => const WatchState(loading: false);

WatchState copyWith({bool? loading}) => WatchState(loading: loading??this.loading);
}
