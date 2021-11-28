import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/core/base_view_model.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';
import 'package:movie_app/feature/movies/service/movie_service.dart';

part 'movie_list_view_model.g.dart';

class MovieListViewModel = _MovieListViewModel with _$MovieListViewModel;

abstract class _MovieListViewModel with Store, BaseViewModel {
  final MovieService _movieService;

  @observable
  List<MovieResponse> moviesList = [];

  @observable
  bool isPageLoading = false;

  _MovieListViewModel(this._movieService);

  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void init() {
    _fetchAllMovies();
  }

  @action
  Future<void> _fetchAllMovies() async {
    _changeLoading();
    final response = await _movieService.fetchMovies();
    moviesList = response;
    _changeLoading();
  }

  @action
  void _changeLoading() {
    isPageLoading = !isPageLoading;
  }
}
