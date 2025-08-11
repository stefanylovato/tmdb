class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? releaseDate;
  final List<String> genres;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.releaseDate,
    required this.genres,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    List<String> genreNames = [];
    if (json['genres'] != null) {
      for (var genre in json['genres']) {
        genreNames.add(genre['name']);
      }
    }

    return MovieModel(
      id: json['id'],
      title: json['title'] ?? 'Title not available',
      overview: json['overview'] ?? 'No description',
      posterPath: json['poster_path'],
      releaseDate: json['release_date'] ?? 'Release date not available',
      genres: genreNames.isNotEmpty ? genreNames : ['No genre found'],
    );
  }
}
