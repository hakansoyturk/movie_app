import 'package:firebase_database/firebase_database.dart';
import 'package:movie_app/feature/movies/model/genre_response.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';

abstract class MovieService {
  final DatabaseReference databaseRef;

  MovieService(this.databaseRef);

  Future<List<MovieResponse>> fetchMovies();

  Future<List<GenreResponse>> fetchGenres();
}
