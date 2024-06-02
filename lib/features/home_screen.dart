import 'package:flutter/material.dart';
import 'package:movie_app/constants/relative_url.dart';
import 'package:movie_app/features/movie_detail_screen.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/features/widgets/movie_card.dart';
import 'package:movie_app/features/widgets/movie_poster.dart';
import 'package:movie_app/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<Movie>> popular =
      ApiService.getMovie(relativeUrl: RelativeUrl.popular);

  final Future<List<Movie>> nowPlaying =
      ApiService.getMovie(relativeUrl: RelativeUrl.nowPlaying);

  final Future<List<Movie>> comingSoon =
      ApiService.getMovie(relativeUrl: RelativeUrl.comingSoon);

  void _onPosterTap({
    required BuildContext context,
    required int id,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MovieDetailScreen(
          id: id,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Row(
          children: [
            Text(
              "SANG🎬FLIX",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 28,
            ),
          )
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 38,
              ),
              const Text(
                "Top Picks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              FutureBuilder(
                future: popular,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 28,
                              ),
                          itemBuilder: (context, index) {
                            var movie = snapshot.data![index];
                            return GestureDetector(
                              onTap: () => _onPosterTap(
                                context: context,
                                id: movie.id,
                              ),
                              child: MoviePoster(
                                posterPath: movie.posterPath,
                                id: movie.id,
                              ),
                            );
                          }),
                    );
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 38,
              ),
              const Text(
                "In Theaters Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              FutureBuilder(
                future: nowPlaying,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 28,
                        ),
                        itemBuilder: (context, index) {
                          var movie = snapshot.data![index];
                          return MovieCard(movie: movie);
                        },
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 38,
              ),
              const Text(
                "Coming Soon",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 18,
              ),
              FutureBuilder(
                future: comingSoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 28,
                        ),
                        itemBuilder: (context, index) {
                          var movie = snapshot.data![index];
                          return MovieCard(movie: movie);
                        },
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.white),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view, color: Colors.white),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: "",
          ),
        ],
      ),
    );
  }
}
