import '../../domain/models/movie_model.dart';

class MovieSearchService {
  List<MovieModel> searchMovies(List<MovieModel> movies, String query) {
    if (query.isEmpty) {
      return movies; // all movies
    }

    return movies.where((movie) {
      return movie.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
