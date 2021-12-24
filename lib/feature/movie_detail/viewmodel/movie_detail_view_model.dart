import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/core/base_view_model.dart';
import 'package:movie_app/feature/movie_detail/service/movie_detail_service.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';

part 'movie_detail_view_model.g.dart';

class MovieDetailViewModel = _MovieDetailViewModel with _$MovieDetailViewModel;

abstract class _MovieDetailViewModel with Store, BaseViewModel {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final MovieDetailService _movieDetailService;

  _MovieDetailViewModel(this._movieDetailService);

  @observable
  bool? isFavorite;

  @override
  void init() {}

  @override
  void setContext(BuildContext? context) => this.context = context;

  @action
  Future<void> changeFavState(MovieResponse movieResponse) async {
    _movieDetailService.changeFavState(movieResponse, uid);
    isFavorite = !(isFavorite ?? true);
  }

  @action
  Future<void> isAddedToFavorite(MovieResponse movieResponse) async {
    _movieDetailService.isFavorite(movieResponse, uid).then((value) {
      isFavorite = value;
    });
  }
}
