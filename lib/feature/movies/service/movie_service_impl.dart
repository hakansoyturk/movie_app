import 'package:firebase_database/firebase_database.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/feature/movies/model/genre_response.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';

import 'movie_service.dart';

class MovieServiceImpl extends MovieService {
  MovieServiceImpl(DatabaseReference databaseRef) : super(databaseRef);

  @override
  Future<List<MovieResponse>> fetchMovies() async {
    return databaseRef
        .child(Constant.MOVIES_DB_PATH)
        .once()
        .then((value) => movieListFromJson(value.value));
  }

  @override
  Future<List<GenreResponse>> fetchGenres() async {
    final snapshot = databaseRef.child(Constant.GENRES_DB_PATH);
    final List<GenreResponse> genres = [];
    final allItem = GenreResponse();
    allItem.id = Constant.ALL_GENRES_ID;
    allItem.name = "All";
    genres.add(allItem);
    snapshot.once().then((value) {
      List<dynamic> response = value.value;
      for (var element in response) {
        genres.add(GenreResponse.fromJson(element));
      }
      return genres;
    });
    return genres;
  }
}
