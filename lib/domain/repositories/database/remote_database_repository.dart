import 'package:tentwenty_assessment/domain/entities/movie.dart';

abstract class RemoteDatabaseRepository{
  Future<List<Movie>> getUpcomingMovies();
  Future<Movie> getMovieById({required String id});
  Future<List<Movie>> searchMovie({required String search});


}