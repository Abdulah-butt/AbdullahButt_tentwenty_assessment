import 'package:get_it/get_it.dart';
import 'package:tentwenty_assessment/data/repositories/database/rest_api_repository.dart';
import 'package:tentwenty_assessment/domain/repositories/database/remote_database_repository.dart';
import 'package:tentwenty_assessment/domain/usecases/fetch_upcoming_movies_use_case.dart';
import 'package:tentwenty_assessment/domain/usecases/search_movie_use_case.dart';
import '../core/alert/app_snack_bar.dart';
import '../core/navigation/app_navigator.dart';
import '../data/repositories/database/hive_database_repository.dart';
import '../domain/repositories/database/local_database_repository.dart';
import '../domain/usecases/movie_detail_use_case.dart';
import '../network/dio/dio_network_repository.dart';
import '../network/network_repository.dart';
import 'app_cubits.dart';
import 'app_services.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static initialize() async {
    getIt.registerSingleton<AppSnackBar>(AppSnackBar());
    getIt.registerSingleton<AppNavigator>(AppNavigator());

    getIt
        .registerSingleton<LocalDatabaseRepository>(HiveDatabaseRepository())
        .initialize();
     getIt.registerSingleton<NetworkRepository>(DioNetworkRepository(getIt())..initialize());
    getIt.registerSingleton<RemoteDatabaseRepository>(RestApiRepository(
      networkRepository: getIt(),
    ));

    /// useCase
    getIt.registerSingleton<FetchUpcomingMoviesUseCase>(FetchUpcomingMoviesUseCase(
      apiRepository: getIt(),
    ));
    getIt.registerSingleton<MovieDetailUseCase>(MovieDetailUseCase(
      apiRepository: getIt(),
    ));
    getIt.registerSingleton<SearchMovieUseCase>(SearchMovieUseCase(
      apiRepository: getIt(),
    ));


    await AppCubits.initialize();
  }
}
