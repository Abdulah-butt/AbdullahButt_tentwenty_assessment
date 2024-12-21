import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_date_booking/ticket_date_booking_navigator.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_player/movie_player_navigator.dart';
import '../../../../core/navigation/app_navigator.dart';
import 'movie_detail_page.dart';
import 'movie_detail_initial_params.dart';

class MovieDetailNavigator with TicketDateBookingRoute,MoviePlayerRoute {
  MovieDetailNavigator(this.navigator);

  @override
  late BuildContext context;

  @override
  late AppNavigator navigator;
}

mixin MovieDetailRoute {
  openMovieDetail(MovieDetailInitialParams initialParams) {
    print("${MovieDetailPage.path}/${initialParams.id}");
    navigator.push(context, "${MovieDetailPage.path}/${initialParams.id}", initialParams);
  }

  AppNavigator get navigator;

  BuildContext get context;
}
