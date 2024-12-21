import '../../../../../domain/entities/seat.dart';

class TicketSeatBookingState {
  final bool loading;
  final List<Seat> selectedSeats;

  const TicketSeatBookingState(
      {required this.loading, required this.selectedSeats});

  factory TicketSeatBookingState.initial() =>
      const TicketSeatBookingState(loading: false, selectedSeats: []);

  TicketSeatBookingState copyWith({bool? loading, List<Seat>? selectedSeats}) =>
      TicketSeatBookingState(
        loading: loading ?? this.loading,
        selectedSeats: selectedSeats ?? this.selectedSeats,
      );
}
