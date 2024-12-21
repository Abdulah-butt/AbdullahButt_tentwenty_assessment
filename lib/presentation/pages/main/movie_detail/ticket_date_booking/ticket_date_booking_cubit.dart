import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/core/alert/app_snack_bar.dart';
import 'package:tentwenty_assessment/domain/usecases/movie_detail_use_case.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_seat_booking/ticket_seat_booking_initial_params.dart';
import '../../../../../domain/entities/movie.dart';
import 'ticket_date_booking_initial_params.dart';
import 'ticket_date_booking_state.dart';
import 'ticket_date_booking_navigator.dart';

class TicketDateBookingCubit extends Cubit<TicketDateBookingState> {
  TicketDateBookingNavigator navigator;
  MovieDetailUseCase movieDetailUseCase;
  AppSnackBar snackBar;

  TicketDateBookingCubit({
    required this.navigator,
    required this.movieDetailUseCase,
    required this.snackBar,
  }) : super(TicketDateBookingState.initial());

  BuildContext get context => navigator.context;

  List<DateTime> availableDates=[];
  DateTime? selectedDate;
  onInit(TicketDateBookingInitialParams initialParams) {
    _getMovieDetail(initialParams.id);
    for(int index=0;index<=10;index++){
      availableDates.add(DateTime.now().add(Duration(days: index)));
    }
    selectedDate=availableDates.first;
  }

  selectSeatAction() {
    navigator.openTicketSeatBooking(TicketSeatBookingInitialParams());
  }

  onSelectDate(DateTime dateTime){
    emit(state.copyWith(selectedDate: dateTime));
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
}
