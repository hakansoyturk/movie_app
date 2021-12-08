// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieListViewModel on _MovieListViewModel, Store {
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
  Future<void> _fetchAllMovies() {
    return _$_fetchAllMoviesAsyncAction.run(() => super._fetchAllMovies());
  }

  final _$_fetchAllGenresAsyncAction =
      AsyncAction('_MovieListViewModel._fetchAllGenres');

  @override
  Future<void> _fetchAllGenres() {
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
  void _changeLoading() {
    final _$actionInfo = _$_MovieListViewModelActionController.startAction(
        name: '_MovieListViewModel._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_MovieListViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filteredList: ${filteredList},
genresList: ${genresList},
isPageLoading: ${isPageLoading}
    ''';
  }
}
