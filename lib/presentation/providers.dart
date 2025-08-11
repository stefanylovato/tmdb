import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/controllers/movie_controller.dart';
import 'screens/controllers/movie_search_controller.dart';
import '../data/data_sources/movie_remote_data_source.dart';
import '../domain/models/movie_model.dart';
import '../application/services/movie_service.dart';
import 'package:http/http.dart' as http;

final httpClientProvider = Provider<http.Client>((ref) {
  return http.Client();
});

final movieRemoteDataSourceProvider = Provider<MovieRemoteDataSource>((ref) {
  final client = ref.watch(httpClientProvider);
  return MovieRemoteDataSource(client);
});

final movieServiceProvider = Provider<MovieService>((ref) {
  final repository = ref.watch(movieRemoteDataSourceProvider);
  return MovieService(repository);
});

final movieControllerProvider =
    AutoDisposeAsyncNotifierProvider<MovieController, List<MovieModel>>(
      MovieController.new,
    );

final movieSearchControllerProvider =
    StateNotifierProvider.family<
      MovieSearchController,
      List<MovieModel>,
      List<MovieModel>
    >((ref, allMovies) {
      return MovieSearchController(allMovies);
    });

final movieSearchControllerProvider2 =
    AutoDisposeNotifierProvider<MovieSearchController2, List<MovieModel>>(
      MovieSearchController2.new,
    );
