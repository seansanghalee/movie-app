class MovieDetail {
  final int id;
  final String imdbId;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final int runtime;
  final List<Map<String, dynamic>> genres;
  final double voteAverage;

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
  });

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        imdbId = json["imdbId"],
        title = json["title"],
        overview = json["overview"],
        posterPath = json["posterPath"],
        releaseDate = json["releaseDate"],
        runtime = json["runtime"],
        genres = json["genres"],
        voteAverage = json["voteAverage"];
}
