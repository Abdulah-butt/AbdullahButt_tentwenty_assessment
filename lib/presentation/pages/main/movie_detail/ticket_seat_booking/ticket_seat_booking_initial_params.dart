class TicketSeatBookingInitialParams {
  final String movieId;
  final String movieName;
  final String date;
  final String hall;

  const TicketSeatBookingInitialParams({
    required this.movieId,
    required this.date,
    required this.hall,
    required this.movieName,
  });
}
