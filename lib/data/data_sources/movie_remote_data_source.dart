import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../domain/models/movie_model.dart';

class MovieRemoteDataSource {
  MovieRemoteDataSource(this.client);

  final http.Client client;

  Future<List<MovieModel>> fetchMovies() async {
    final apiKey = dotenv.env['TMDB_API_KEY'];
    if (apiKey == null) {
      throw Exception('TMDB_API_KEY not found in .env file');
    }
    final response = await client.get(
      Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body)['results'];
      return jsonResponse.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies: ${response.statusCode}');
    }
  }
}
