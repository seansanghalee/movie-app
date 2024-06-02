import 'package:flutter/material.dart';
import 'package:movie_app/features/movie_detail_screen.dart';
import 'package:movie_app/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  void _onTap(BuildContext context, int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MovieDetailScreen(id: id),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const String baseUrl = "https://image.tmdb.org/t/p/w500/";

    return GestureDetector(
      onTap: () => _onTap(context, movie.id),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.width / 2.5,
              width: MediaQuery.of(context).size.width / 3,
              "$baseUrl${movie.posterPath}",
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Text(
              movie.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
