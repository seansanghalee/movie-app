import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/movie_detail.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";

  static Future<List<Movie>> getMovie({required String relativeUrl}) async {
    final url = Uri.parse("$baseUrl/$relativeUrl");
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
    final url = Uri.parse("$baseUrl/movie?id=$id");
    final response = await get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final MovieDetail movieDetail = MovieDetail.fromJson(json);

      return movieDetail;
    }

    throw Error();
  }
}
