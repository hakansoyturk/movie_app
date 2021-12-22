import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/core/base_view_model.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/feature/movies/model/genre_response.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';
import 'package:movie_app/feature/movies/service/movie_service.dart';
import 'package:movie_app/util/store_state.dart';

part 'movie_list_view_model.g.dart';

class MovieListViewModel extends _MovieListViewModel with _$MovieListViewModel {
  MovieListViewModel(MovieService movieService) : super(movieService);
}

abstract class _MovieListViewModel with Store, BaseViewModel {
  final MovieService _movieService;

  _MovieListViewModel(this._movieService);

  @observable
  ObservableFuture<List<MovieResponse>>? _observableMovieList;

  @observable
  List<MovieResponse> _movies = [];

  @observable
  List<MovieResponse> filteredList = [];

  @observable
  List<GenreResponse> genresList = [];

  @observable
  bool isPageLoading = false;

  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void init() {
    _fetchAllMovies();
    _fetchAllGenres();
  }

  @action
  Future _fetchAllMovies() async {
    _observableMovieList = ObservableFuture(_movieService.fetchMovies());
    _movies = await _observableMovieList!;
    filteredList = _movies;
  }

  @action
  Future _fetchAllGenres() async {
    final response = await _movieService.fetchGenres();
    genresList = response;
  }

  @action
  void filterList(int genreId) {
    if (genreId == Constant.ALL_GENRES_ID) {
      filteredList = _movies;
      return;
    }
    filteredList = _movies
        .where((element) => element.genreIds!.contains(genreId))
        .toList();
  }

  @computed
  StoreState get state {
    if (_observableMovieList == null ||
        _observableMovieList!.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _observableMovieList!.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  void navigateToDetail(MovieResponse movieResponse) {
    navigation.navigateToPage(path: "/detail", data: movieResponse);
  }
}
