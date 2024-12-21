import 'package:tentwenty_assessment/presentation/pages/main/dashboard/dashboard_cubit.dart';
import 'package:tentwenty_assessment/presentation/pages/main/dashboard/dashboard_navigator.dart';
import 'package:tentwenty_assessment/presentation/pages/main/media_library/media_library_cubit.dart';
import 'package:tentwenty_assessment/presentation/pages/main/media_library/media_library_navigator.dart';
import 'package:tentwenty_assessment/presentation/pages/main/more/more_cubit.dart';
import 'package:tentwenty_assessment/presentation/pages/main/more/more_navigator.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/movie_detail_cubit.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/movie_detail_navigator.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_date_booking/ticket_date_booking_cubit.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_date_booking/ticket_date_booking_navigator.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_seat_booking/ticket_seat_booking_cubit.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/ticket_seat_booking/ticket_seat_booking_navigator.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_player/movie_player_cubit.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_player/movie_player_navigator.dart';
import 'package:tentwenty_assessment/presentation/pages/main/search/search_cubit.dart';
import 'package:tentwenty_assessment/presentation/pages/main/search/search_navigator.dart';
import 'package:tentwenty_assessment/presentation/pages/main/watch/watch_cubit.dart';
import 'package:tentwenty_assessment/presentation/pages/main/watch/watch_navigator.dart';

import '../presentation/pages/splash/splash_cubit.dart';
import '../presentation/pages/splash/splash_navigator.dart';
import 'service_locator.dart';

/*
     ==============================================================
     THIS CLASS WITH REGISTER SCREENS CUBITS AND NAVIGATORS
      -> NAVIGATORS WILL BE USED FOR NAVIGATION TO OTHER SCREEN
      -> CUBIT WILL BE USED FOR EVENT HANDLING OR BUSINESS LOGIC
      -> BOTH ARE REGISTERED IN GET-IT TO KEEP MEMORY OPTIMIZATION AND SERVICE LOCATOR
     ==============================================================
   */

class AppCubits {
  static initialize() async {
    /// splash screen Cubit + navigator
    getIt.registerSingleton<SplashNavigator>(SplashNavigator(getIt()));
    getIt.registerSingleton<SplashCubit>(SplashCubit(
      navigator: getIt(),
    ));
    getIt.registerSingleton<DashboardNavigator>(DashboardNavigator(getIt()));
    getIt.registerSingleton<DashboardCubit>(DashboardCubit(
      navigator: getIt(),
      fetchUpcomingMoviesUseCase: getIt(),
      snackBar: getIt(),
    ));
    getIt.registerSingleton<WatchNavigator>(WatchNavigator(getIt()));
    getIt.registerSingleton<WatchCubit>(WatchCubit(
      navigator: getIt(),
    ));
    getIt.registerSingleton<MediaLibraryNavigator>(
        MediaLibraryNavigator(getIt()));
    getIt.registerSingleton<MediaLibraryCubit>(MediaLibraryCubit(
      navigator: getIt(),
    ));
    getIt.registerSingleton<MoreNavigator>(MoreNavigator(getIt()));
    getIt.registerSingleton<MoreCubit>(MoreCubit(
      navigator: getIt(),
    ));
    getIt.registerSingleton<SearchNavigator>(SearchNavigator(getIt()));
    getIt.registerSingleton<SearchCubit>(SearchCubit(
      navigator: getIt(),
      searchMovieUseCase: getIt(),
      snackBar: getIt(),
    ));
    getIt
        .registerSingleton<MovieDetailNavigator>(MovieDetailNavigator(getIt()));
    getIt.registerSingleton<MovieDetailCubit>(MovieDetailCubit(
      navigator: getIt(),
      snackBar: getIt(),
      movieDetailUseCase: getIt(),
    ));
    getIt.registerSingleton<TicketDateBookingNavigator>(
        TicketDateBookingNavigator(getIt()));
    getIt.registerSingleton<TicketDateBookingCubit>(TicketDateBookingCubit(
      navigator: getIt(),
      snackBar: getIt(),
      movieDetailUseCase: getIt(),
    ));

    getIt.registerSingleton<TicketSeatBookingNavigator>(
        TicketSeatBookingNavigator(getIt()));
    getIt.registerSingleton<TicketSeatBookingCubit>(TicketSeatBookingCubit(
      navigator: getIt(),
    ));
    getIt.registerSingleton<MoviePlayerNavigator>(
        MoviePlayerNavigator(getIt()));
    getIt.registerSingleton<MoviePlayerCubit>(MoviePlayerCubit(
      navigator: getIt(),
    ));

  }
}
