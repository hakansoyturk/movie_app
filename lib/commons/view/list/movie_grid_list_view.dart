import 'package:flutter/material.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';

// TODO this ListView will be use also favourite screen
class MovieGridListView extends StatelessWidget {
  const MovieGridListView({Key? key, this.models, this.onPressed}) : super(key: key);

  final List<MovieResponse>? models;
  final Function(MovieResponse item, int index)? onPressed;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        shrinkWrap: true,
        itemCount: models!.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: onPressed!(models![index], index),
            child: buildMovieCardView(models![index], context),
          );
        });
  }

  // TODO Extract this view into another file
  Card buildMovieCardView(MovieResponse movieResponse, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(Constant.MOVIE_IMAGES_BASE_URL + movieResponse.posterPath!,
                  fit: BoxFit.fill, width: MediaQuery.of(context).size.width * 0.58),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                color: const Color(0x99464646),
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 4, right: 4, bottom: 2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        movieResponse.originalTitle ?? "Empty",
                        maxLines: 1,
                        style:
                            const TextStyle(color: Colors.white, fontFamily: "Open Sans", fontWeight: FontWeight.w700),
                      ),
                      Text(
                        movieResponse.overview ?? "Empty",
                        maxLines: 3,
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
