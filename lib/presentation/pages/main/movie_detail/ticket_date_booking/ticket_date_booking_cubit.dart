import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tentwenty_assessment/core/alert/app_snack_bar.dart';
import 'package:tentwenty_assessment/domain/usecases/movie_detail_use_case.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_seat_booking/ticket_seat_booking_initial_params.dart';
import '../../../../../domain/entities/cinema_hall.dart';
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
  List<CinemaHall> availableCinemaHalls=[
    CinemaHall(name: "Cinetech +  hall 1",price: 50,bonus: 2500,time: "12:30"),
    CinemaHall(name: "Avenger +  hall 4",price: 35,bonus: 2000,time: "1:30"),
    CinemaHall(name: "TechSlow +  hall 3",price: 20,bonus: 1500,time: "2:30"),
    CinemaHall(name: "BigBite +  hall 2",price: 10,bonus: 500,time: "4:30"),
  ];

  DateTime? selectedDate;
  onInit(TicketDateBookingInitialParams initialParams) {
    _getMovieDetail(initialParams.id);
    for(int index=0;index<=10;index++){
      availableDates.add(DateTime.now().add(Duration(days: index)));
    }
    selectedDate=availableDates.first;
  }

  selectSeatAction() {
    navigator.openTicketSeatBooking(TicketSeatBookingInitialParams(
      movieId: state.movie.id.toString(),
      movieName: state.movie.title.toString(),
      hall: state.selectedCinemaHall!.name.toString(),
      date: DateFormat('dd MMM').format(state.selectedDate!)
    ));
  }

  onSelectDate(DateTime dateTime){
    emit(state.copyWith(selectedDate: dateTime));
  }
  onCinemaHallSelect(CinemaHall cinemaHall){
    emit(state.copyWith(selectedCinemaHall: cinemaHall));
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
