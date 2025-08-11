import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb/presentation/providers.dart';
import '../../../application/services/movie_service.dart';
import '../../../domain/models/movie_model.dart';

class MovieController extends AutoDisposeAsyncNotifier<List<MovieModel>> {
  late final MovieService _movieService;

  @override
  Future<List<MovieModel>> build() async {
    _movieService = ref.watch(movieServiceProvider);
    return await _movieService.fetchMovies();
  }
}
