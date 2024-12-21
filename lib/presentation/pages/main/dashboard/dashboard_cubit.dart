import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/core/alert/app_snack_bar.dart';
import 'package:tentwenty_assessment/domain/usecases/fetch_upcoming_movies_use_case.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/movie_detail_initial_params.dart';
import 'package:tentwenty_assessment/presentation/pages/main/search/search_initial_params.dart';
import '../../../../domain/entities/movie.dart';
import 'dashboard_initial_params.dart';
import 'dashboard_state.dart';
import 'dashboard_navigator.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardNavigator navigator;
  FetchUpcomingMoviesUseCase fetchUpcomingMoviesUseCase;
  AppSnackBar snackBar;

  DashboardCubit({
    required this.navigator,
    required this.fetchUpcomingMoviesUseCase,
    required this.snackBar,
  }) : super(DashboardState.initial());

  BuildContext get context => navigator.context;

  onInit(DashboardInitialParams initialParams) {
    _getAllMovies();
  }

  searchAction() {
    navigator.openSearch(SearchInitialParams());
  }

  movieDetailAction(Movie movie) {
    navigator.openMovieDetail(MovieDetailInitialParams(
      id: movie.id.toString()
    ));
  }

  _getAllMovies() async {
    try {
      emit(state.copyWith(loading: state.movies.isEmpty));
      List<Movie> movies=await fetchUpcomingMoviesUseCase.execute();
      emit(state.copyWith(movies: movies));
    } catch (e) {
      snackBar.show(e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}
