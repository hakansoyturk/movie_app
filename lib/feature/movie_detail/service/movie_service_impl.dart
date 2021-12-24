import 'package:firebase_database/firebase_database.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';

import 'movie_detail_service.dart';

class MovieDetailServiceImpl extends MovieDetailService {
  MovieDetailServiceImpl(DatabaseReference databaseRef) : super(databaseRef);

  @override
  Future<bool> isFavorite(MovieResponse movieResponse, String uid) async {
    return databaseRef
        .child(Constant.USERS_PATH)
        .child(uid)
        .child(movieResponse.id.toString())
        .once()
        .then((value) => value.exists);
  }

  @override
  Future<void> changeFavState(MovieResponse movieResponse, String uid) async {
    final snapshot = databaseRef
        .child(Constant.USERS_PATH)
        .child(uid)
        .child(movieResponse.id.toString());
    snapshot.once().then((value) {
      if (value.exists) {
        snapshot.remove();
      } else {
        snapshot.set(movieResponse.toJson());
      }
    });
  }
}
