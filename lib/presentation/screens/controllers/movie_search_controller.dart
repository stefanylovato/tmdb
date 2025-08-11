import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/movie_model.dart';
import '../../providers.dart';

class MovieSearchController extends StateNotifier<List<MovieModel>> {
  final List<MovieModel> allMovies;

  MovieSearchController(this.allMovies) : super([]);

  void searchMovies(String query) {
    if (query.isEmpty) {
      state = [];
    } else {
      state = allMovies.where((movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }
}

class MovieSearchController2 extends AutoDisposeNotifier<List<MovieModel>> {
  @override
  List<MovieModel> build() {
    return [];
  }

  void searchMovies(String query) {
    final allMovies = ref.watch(movieServiceProvider).allMovies;
    if (query.isEmpty) {
      state = [];
    } else {
      state = allMovies.where((movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }
}
