import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'movie_poster_link.dart';

class MoviesMasonry extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MoviesMasonry({super.key, required this.movies, this.loadNextPage});

  @override
  State<MoviesMasonry> createState() => _MoviesMasonryState();
}

class _MoviesMasonryState extends State<MoviesMasonry> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if ((scrollController.position.pixels + 100) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: MasonryGridView.count(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemCount: widget.movies.length,
          itemBuilder: (context, index) {
            if (index == 1) {
              return Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  MoviePosterLink(movie: widget.movies[index])
                ],
              );
            }
            return MoviePosterLink(movie: widget.movies[index]);
          }),
    );
  }
}
