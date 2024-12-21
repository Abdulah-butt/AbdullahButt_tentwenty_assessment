import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/core/alert/app_snack_bar.dart';
import 'package:tentwenty_assessment/domain/entities/movie.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_date_booking/ticket_date_booking_initial_params.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_player/movie_player_initial_params.dart';
import '../../../../domain/usecases/movie_detail_use_case.dart';
import 'movie_detail_initial_params.dart';
import 'movie_detail_state.dart';
import 'movie_detail_navigator.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailNavigator navigator;
  MovieDetailUseCase movieDetailUseCase;
  AppSnackBar snackBar;
  MovieDetailCubit({
    required this.navigator,
    required this.movieDetailUseCase,
    required this.snackBar,

  }) : super(MovieDetailState.initial());

  BuildContext get context => navigator.context;

  onInit(MovieDetailInitialParams initialParams) {
    debugPrint("movie id: ${initialParams.id}");
    _getMovieDetail(initialParams.id);
  }

  _getMovieDetail(String id) async {
    try {
      emit(state.copyWith(loading: true));
      // Provider provider=Provider.shimmer();
      Movie movie = await movieDetailUseCase.execute(id: id);
      emit(state.copyWith(movie: movie));
    } catch (e) {
      Navigator.pop(context);
      snackBar.show(e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  getTicketAction() {
    navigator.openTicketDateBooking(TicketDateBookingInitialParams(
      id: state.movie.id.toString()
    ));
  }
  
  watchTrailerAction(){
    navigator.openMoviePlayer(MoviePlayerInitialParams(url:"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"));
  }
}
