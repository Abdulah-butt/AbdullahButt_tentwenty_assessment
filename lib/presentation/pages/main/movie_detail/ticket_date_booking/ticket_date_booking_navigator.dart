import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_seat_booking/ticket_seat_booking_navigator.dart';
import '../../../../../core/navigation/app_navigator.dart';
import 'ticket_date_booking_page.dart';
import 'ticket_date_booking_initial_params.dart';



class TicketDateBookingNavigator with TicketSeatBookingRoute{
TicketDateBookingNavigator(this.navigator);

@override
late BuildContext context;

@override
late AppNavigator navigator;

}

mixin TicketDateBookingRoute {
openTicketDateBooking(TicketDateBookingInitialParams initialParams) {

 navigator.push(context, "${TicketDateBookingPage.path}/${initialParams.id}", initialParams);

}

AppNavigator get navigator;

BuildContext get context;
}
