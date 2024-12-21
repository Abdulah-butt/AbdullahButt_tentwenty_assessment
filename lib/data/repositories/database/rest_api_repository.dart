import 'package:tentwenty_assessment/data/models/movie_json.dart';
import 'package:tentwenty_assessment/domain/entities/movie.dart';
import 'package:tentwenty_assessment/network/api_endpoint.dart';
import 'package:tentwenty_assessment/network/network_repository.dart';

import '../../../domain/repositories/database/remote_database_repository.dart';

class RestApiRepository implements RemoteDatabaseRepository {
  NetworkRepository networkRepository;

  RestApiRepository({required this.networkRepository});

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    var response =
        await networkRepository.sendRequest(APIEndpoint.upcomingMovies,
        );
    return (response['results'] as List)
        .map((data) => MovieJson.fromJson(data).toDomain())
        .toList();
  }

  @override
  Future<Movie> getMovieById({required String id}) async {
    var response =
        await networkRepository.sendRequest("${APIEndpoint.movieDetail}/$id",
    );
    return MovieJson.fromJson(response).toDomain();
  }

  @override
  Future<List<Movie>> searchMovie({required String search}) async {
    var response = await networkRepository.sendRequest(APIEndpoint.searchMovie,
      parameters: {
      "query":search
      }
    );
    return (response['results'] as List)
        .map((data) => MovieJson.fromJson(data).toDomain())
        .toList();
  }
}
