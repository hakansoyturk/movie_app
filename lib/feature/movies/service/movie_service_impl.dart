import 'package:firebase_database/firebase_database.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';

import 'movie_service.dart';

class MovieServiceImpl extends MovieService {
  MovieServiceImpl(DatabaseReference databaseRef) : super(databaseRef);

  @override
  Future<List<MovieResponse>> fetchMovies() async {
    final snapshot = databaseRef.child("movies");
    final List<MovieResponse> movies = [];
    snapshot.once().then((value) {
      List<dynamic> response = value.value;
      for (var element in response) {
        movies.add(MovieResponse.fromJson(element));
      }
    });
    return movies;
  }
}
