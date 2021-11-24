// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieListViewModel on _MovieListViewModel, Store {
  final _$moviesListAtom = Atom(name: '_MovieListViewModel.moviesList');

  @override
  List<MovieResponse> get moviesList {
    _$moviesListAtom.reportRead();
    return super.moviesList;
  }

  @override
  set moviesList(List<MovieResponse> value) {
    _$moviesListAtom.reportWrite(value, super.moviesList, () {
      super.moviesList = value;
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

  final _$_MovieListViewModelActionController =
      ActionController(name: '_MovieListViewModel');

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
moviesList: ${moviesList},
isPageLoading: ${isPageLoading}
    ''';
  }
}
