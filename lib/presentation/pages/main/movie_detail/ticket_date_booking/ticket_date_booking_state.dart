import 'package:tentwenty_assessment/domain/entities/cinema_hall.dart';
import 'package:tentwenty_assessment/domain/entities/movie.dart';

class TicketDateBookingState {
  final bool loading;
  final Movie movie;
  final DateTime? selectedDate;
  final CinemaHall? selectedCinemaHall;


  const TicketDateBookingState({
    required this.loading,
    required this.movie,
    this.selectedDate,
    this.selectedCinemaHall,

  });

  factory TicketDateBookingState.initial() =>
      TicketDateBookingState(loading: false, movie: Movie.shimmer());

  TicketDateBookingState copyWith(
          {bool? loading, Movie? movie, DateTime? selectedDate,CinemaHall? selectedCinemaHall}) =>
      TicketDateBookingState(
        loading: loading ?? this.loading,
        movie: movie ?? this.movie,
        selectedDate: selectedDate ?? this.selectedDate,
        selectedCinemaHall: selectedCinemaHall ?? this.selectedCinemaHall,

      );
}
