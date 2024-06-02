import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/constants/relative_url.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/movie_detail.dart';

class ApiService {
  static const String _baseUrl = "https://movies-api.nomadcoders.workers.dev";

  static Future<List<Movie>> getMovie(
      {required RelativeUrl relativeUrl}) async {
    late String path;

    switch (relativeUrl) {
      case RelativeUrl.popular:
        path = "popular";
      case RelativeUrl.nowPlaying:
        path = "now-playing";
      case RelativeUrl.comingSoon:
        path = "coming-soon";
      default:
    }

    final url = Uri.parse("$_baseUrl/$path");
    final response = await get(url);

    List<Movie> movies = [];

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      for (var json in json["results"]) {
        final Movie movie = Movie.fromJson(json);
        movies.add(movie);
      }

      return movies;
    }

    throw Error();
  }

  static Future<MovieDetail> getMovieDetail({required int id}) async {
    final url = Uri.parse("$_baseUrl/movie?id=$id");
    final response = await get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final MovieDetail movieDetail = MovieDetail.fromJson(json);

      return movieDetail;
    }

    throw Error();
  }
}
