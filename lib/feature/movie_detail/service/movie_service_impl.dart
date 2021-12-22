import 'package:firebase_database/firebase_database.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';

import 'movie_detail_service.dart';

class MovieDetailServiceImpl extends MovieDetailService {
  MovieDetailServiceImpl(DatabaseReference databaseRef) : super(databaseRef);

  @override
  Future<bool> isFavorite(MovieResponse movieResponse, String uid) async {
    bool isFavorite = false;
    final snapshot = databaseRef
        .child(Constant.USERS_PATH)
        .child(uid)
        .child(movieResponse.id.toString());
    snapshot.onValue.listen((event) {
      isFavorite = event.snapshot.exists;
    });
    return isFavorite;
  }

  @override
  Future<void> changeFavState(MovieResponse movieResponse, String uid) async {
    final snapshot = databaseRef.child(Constant.USERS_PATH).child(uid);
    snapshot.child(movieResponse.id.toString()).once().then((value) {
      if (value.exists) {
        snapshot.child(movieResponse.id.toString()).remove();
      } else {
        snapshot
            .child(movieResponse.id.toString())
            .update(movieResponse.toJson());
      }
    });
  }
}
