import 'package:tentwenty_assessment/domain/entities/movie.dart';

class TicketDateBookingState {
  final bool loading;
  final Movie movie;
  final DateTime? selectedDate;

  const TicketDateBookingState({
    required this.loading,
    required this.movie,
    this.selectedDate,
  });

  factory TicketDateBookingState.initial() =>
      TicketDateBookingState(loading: false, movie: Movie.shimmer());

  TicketDateBookingState copyWith(
          {bool? loading, Movie? movie, DateTime? selectedDate}) =>
      TicketDateBookingState(
        loading: loading ?? this.loading,
        movie: movie ?? this.movie,
        selectedDate: selectedDate ?? this.selectedDate,
      );
}
