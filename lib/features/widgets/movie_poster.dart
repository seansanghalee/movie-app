import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final String posterPath;
  final int id;

  const MoviePoster({
    super.key,
    required this.posterPath,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    const String baseUrl = "https://image.tmdb.org/t/p/w500/";

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Image.network(
        "$baseUrl$posterPath",
      ),
    );
  }
}
