import 'package:tentwenty_assessment/domain/entities/movie.dart';
import 'package:tentwenty_assessment/domain/repositories/database/remote_database_repository.dart';

class MovieDetailUseCase{
  RemoteDatabaseRepository apiRepository;
  MovieDetailUseCase({required this.apiRepository});

  Future<Movie> execute({required String id}) async {
    Movie movie=await  apiRepository.getMovieById(id: id);
    /// TODO: STORE LOCALLY
    return movie;
  }
}