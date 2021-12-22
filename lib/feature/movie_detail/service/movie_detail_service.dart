import 'package:firebase_database/firebase_database.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';

abstract class MovieDetailService {
  final DatabaseReference databaseRef;

  MovieDetailService(this.databaseRef);

  Future<void> changeFavState(MovieResponse movieResponse, String uid);

  Future<bool> isFavorite(MovieResponse movieResponse, String uid);
}
