import 'package:firebase_database/firebase_database.dart';
import 'package:movie_app/feature/movies/model/genre_response.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';

abstract class FavoriteMovieService {
  final DatabaseReference databaseRef;

  FavoriteMovieService(this.databaseRef);

  Future<List<MovieResponse>> fetchFavoriteMovies(String uid);

  Future<List<GenreResponse>> fetchGenres();
}
