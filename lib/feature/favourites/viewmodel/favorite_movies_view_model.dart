import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/core/base_view_model.dart';
import 'package:movie_app/feature/favourites/service/favorite_movie_service.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';
import 'package:movie_app/util/store_state.dart';

part 'favorite_movies_view_model.g.dart';

class FavoriteMoviesViewModel = _FavoriteMoviesViewModel
    with _$FavoriteMoviesViewModel;

abstract class _FavoriteMoviesViewModel with Store, BaseViewModel {
  final FavoriteMovieService _favoriteMovieService;

  _FavoriteMoviesViewModel(this._favoriteMovieService);

  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void init() {
    _fetchFavoriteMovies();
  }

  @observable
  ObservableFuture<List<MovieResponse>>? _observableFavoriteList;

  @observable
  List<MovieResponse>? favoriteMovies;

  final String uid = FirebaseAuth.instance.currentUser!.uid;

  @computed
  StoreState get state {
    if (_observableFavoriteList == null ||
        _observableFavoriteList!.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _observableFavoriteList!.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future _fetchFavoriteMovies() async {
    _observableFavoriteList =
        ObservableFuture(_favoriteMovieService.fetchFavoriteMovies(uid));
    favoriteMovies = await _observableFavoriteList;
  }

  @action
  Future navigateToDetail(MovieResponse movieResponse) async {
    navigation.navigateToPage(path: "/detail", data: movieResponse);
  }
}
