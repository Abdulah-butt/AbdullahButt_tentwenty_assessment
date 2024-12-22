import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/domain/entities/seat.dart';
import 'ticket_seat_booking_initial_params.dart';
import 'ticket_seat_booking_state.dart';
import 'ticket_seat_booking_navigator.dart';

class TicketSeatBookingCubit extends Cubit<TicketSeatBookingState> {
  TicketSeatBookingNavigator navigator;

  TicketSeatBookingCubit({required this.navigator})
      : super(TicketSeatBookingState.initial());

  BuildContext get context => navigator.context;

  onInit(TicketSeatBookingInitialParams initialParams) {}

  selectSeat(Seat seat) {
    List<Seat> tempSeats=List.from(state.selectedSeats);
    if (tempSeats.contains(seat)) {
      tempSeats.remove(seat);
    } else {
      tempSeats.add(seat);
    }
    emit(state.copyWith(selectedSeats:tempSeats));
  }

  onRemoveAction(Seat seat){
    List<Seat> tempSeats=List.from(state.selectedSeats);
    tempSeats.remove(seat);
    emit(state.copyWith(selectedSeats:tempSeats));
  }
}
