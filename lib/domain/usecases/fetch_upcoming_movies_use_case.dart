import 'package:tentwenty_assessment/domain/entities/movie.dart';
import 'package:tentwenty_assessment/domain/repositories/database/remote_database_repository.dart';

class FetchUpcomingMoviesUseCase{
  RemoteDatabaseRepository apiRepository;
  FetchUpcomingMoviesUseCase({required this.apiRepository});

  Future<List<Movie>> execute() async {
   List<Movie> movies=await  apiRepository.getUpcomingMovies();
   /// TODO: STORE LOCALLY

    return movies;
  }
}