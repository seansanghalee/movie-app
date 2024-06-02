class MovieDetail {
  final int id;
  final String imdbId;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final int runtime;
  final List<dynamic> genres;
  final double voteAverage;
  final int voteCount;

  MovieDetail({
    required this.id,
    required this.imdbId,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.genres,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        imdbId = json["imdb_id"],
        title = json["title"],
        overview = json["overview"],
        posterPath = json["poster_path"],
        releaseDate = json["release_date"],
        runtime = json["runtime"],
        genres = json["genres"],
        voteAverage = json["vote_average"],
        voteCount = json["vote_count"];
}
