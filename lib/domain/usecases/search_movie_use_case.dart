import 'package:tentwenty_assessment/domain/entities/movie.dart';
import 'package:tentwenty_assessment/domain/repositories/database/remote_database_repository.dart';

class SearchMovieUseCase{
  RemoteDatabaseRepository apiRepository;
  SearchMovieUseCase({required this.apiRepository});

  Future<List<Movie>> execute({required String search}) async {
    List<Movie> movies=await  apiRepository.searchMovie(search: search);
    /// TODO: STORE LOCALLY
    return movies;
  }
}