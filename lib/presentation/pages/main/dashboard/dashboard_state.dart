import 'dashboard_initial_params.dart';

class DashboardState {
final bool loading;
const DashboardState({required this.loading});

factory DashboardState.initial() => const DashboardState(loading: false);

DashboardState copyWith({bool? loading}) => DashboardState(loading: loading??this.loading);
}
