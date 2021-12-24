import 'package:firebase_database/firebase_database.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/feature/movies/model/genre_response.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';

import 'favorite_movie_service.dart';

class FavoriteMovieServiceImpl extends FavoriteMovieService {
  FavoriteMovieServiceImpl(DatabaseReference databaseRef) : super(databaseRef);

  @override
  Future<List<MovieResponse>> fetchFavoriteMovies(String uid) async {
    return databaseRef
        .child(Constant.USERS_PATH)
        .child(uid)
        .once()
        .then((value) => movieListFromMapJson(value.value));
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
