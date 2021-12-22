// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieListViewModel on _MovieListViewModel, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_MovieListViewModel.state'))
          .value;

  final _$_observableMovieListAtom =
      Atom(name: '_MovieListViewModel._observableMovieList');

  @override
  ObservableFuture<List<MovieResponse>>? get _observableMovieList {
    _$_observableMovieListAtom.reportRead();
    return super._observableMovieList;
  }

  @override
  set _observableMovieList(ObservableFuture<List<MovieResponse>>? value) {
    _$_observableMovieListAtom.reportWrite(value, super._observableMovieList,
        () {
      super._observableMovieList = value;
    });
  }

  final _$_moviesAtom = Atom(name: '_MovieListViewModel._movies');

  @override
  List<MovieResponse> get _movies {
    _$_moviesAtom.reportRead();
    return super._movies;
  }

  @override
  set _movies(List<MovieResponse> value) {
    _$_moviesAtom.reportWrite(value, super._movies, () {
      super._movies = value;
    });
  }

  final _$filteredListAtom = Atom(name: '_MovieListViewModel.filteredList');

  @override
  List<MovieResponse> get filteredList {
    _$filteredListAtom.reportRead();
    return super.filteredList;
  }

  @override
  set filteredList(List<MovieResponse> value) {
    _$filteredListAtom.reportWrite(value, super.filteredList, () {
      super.filteredList = value;
    });
  }

  final _$genresListAtom = Atom(name: '_MovieListViewModel.genresList');

  @override
  List<GenreResponse> get genresList {
    _$genresListAtom.reportRead();
    return super.genresList;
  }

  @override
  set genresList(List<GenreResponse> value) {
    _$genresListAtom.reportWrite(value, super.genresList, () {
      super.genresList = value;
    });
  }

  final _$isPageLoadingAtom = Atom(name: '_MovieListViewModel.isPageLoading');

  @override
  bool get isPageLoading {
    _$isPageLoadingAtom.reportRead();
    return super.isPageLoading;
  }

  @override
  set isPageLoading(bool value) {
    _$isPageLoadingAtom.reportWrite(value, super.isPageLoading, () {
      super.isPageLoading = value;
    });
  }

  final _$_fetchAllMoviesAsyncAction =
      AsyncAction('_MovieListViewModel._fetchAllMovies');

  @override
  Future<dynamic> _fetchAllMovies() {
    return _$_fetchAllMoviesAsyncAction.run(() => super._fetchAllMovies());
  }

  final _$_fetchAllGenresAsyncAction =
      AsyncAction('_MovieListViewModel._fetchAllGenres');

  @override
  Future<dynamic> _fetchAllGenres() {
    return _$_fetchAllGenresAsyncAction.run(() => super._fetchAllGenres());
  }

  final _$_MovieListViewModelActionController =
      ActionController(name: '_MovieListViewModel');

  @override
  void filterList(int genreId) {
    final _$actionInfo = _$_MovieListViewModelActionController.startAction(
        name: '_MovieListViewModel.filterList');
    try {
      return super.filterList(genreId);
    } finally {
      _$_MovieListViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filteredList: ${filteredList},
genresList: ${genresList},
isPageLoading: ${isPageLoading},
state: ${state}
    ''';
  }
}
