import 'package:flutter/material.dart';
import '../../../../../core/navigation/app_navigator.dart';
import 'ticket_seat_booking_page.dart';
import 'ticket_seat_booking_initial_params.dart';



class TicketSeatBookingNavigator {
TicketSeatBookingNavigator(this.navigator);

@override
late BuildContext context;

@override
late AppNavigator navigator;

}

mixin TicketSeatBookingRoute {
openTicketSeatBooking(TicketSeatBookingInitialParams initialParams) {

 navigator.push(context, "${TicketSeatBookingPage.path}?movieId=${initialParams.movieId}&movieName=${initialParams.movieName}&hall=${initialParams.hall}&date=${initialParams.date}", initialParams);

}

AppNavigator get navigator;

BuildContext get context;
}
