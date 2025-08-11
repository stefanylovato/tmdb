import '../../data/data_sources/movie_remote_data_source.dart';
import '../../domain/models/movie_model.dart';

class MovieService {
  final MovieRemoteDataSource _repository;

  MovieService(this._repository);
  List<MovieModel> allMovies = [];

  Future<List<MovieModel>> fetchMovies() async {
    try {
      allMovies = await _repository.fetchMovies();
      return allMovies;
    } catch (e) {
      throw Exception('Failed to load movies.');
    }
  }
}
