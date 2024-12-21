import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/core/alert/app_snack_bar.dart';
import 'package:tentwenty_assessment/domain/usecases/search_movie_use_case.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/movie_detail_initial_params.dart';
import '../../../../domain/entities/movie.dart';
import 'search_initial_params.dart';
import 'search_state.dart';
import 'search_navigator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchNavigator navigator;
  SearchMovieUseCase searchMovieUseCase;
  AppSnackBar snackBar;

  SearchCubit({
    required this.navigator,
    required this.searchMovieUseCase,
    required this.snackBar,
  }) : super(SearchState.initial());

  BuildContext get context => navigator.context;

  onInit(SearchInitialParams initialParams) {}

  final txtSearch = TextEditingController();

  onSearch(val) async {
    try {
      emit(state.copyWith(loading: true));
      List<Movie>  movies=await searchMovieUseCase.execute(search: val);
      emit(state.copyWith(movies: movies));
    } catch (e) {
      snackBar.show(e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  movieDetail(Movie movie){
    navigator.openMovieDetail(MovieDetailInitialParams(id: movie.id.toString()));
  }
}
