// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movies_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteMoviesViewModel on _FavoriteMoviesViewModel, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_FavoriteMoviesViewModel.state'))
          .value;

  final _$_observableFavoriteListAtom =
      Atom(name: '_FavoriteMoviesViewModel._observableFavoriteList');

  @override
  ObservableFuture<List<MovieResponse>>? get _observableFavoriteList {
    _$_observableFavoriteListAtom.reportRead();
    return super._observableFavoriteList;
  }

  @override
  set _observableFavoriteList(ObservableFuture<List<MovieResponse>>? value) {
    _$_observableFavoriteListAtom
        .reportWrite(value, super._observableFavoriteList, () {
      super._observableFavoriteList = value;
    });
  }

  final _$favoriteMoviesAtom =
      Atom(name: '_FavoriteMoviesViewModel.favoriteMovies');

  @override
  List<MovieResponse>? get favoriteMovies {
    _$favoriteMoviesAtom.reportRead();
    return super.favoriteMovies;
  }

  @override
  set favoriteMovies(List<MovieResponse>? value) {
    _$favoriteMoviesAtom.reportWrite(value, super.favoriteMovies, () {
      super.favoriteMovies = value;
    });
  }

  final _$_fetchFavoriteMoviesAsyncAction =
      AsyncAction('_FavoriteMoviesViewModel._fetchFavoriteMovies');

  @override
  Future<dynamic> _fetchFavoriteMovies() {
    return _$_fetchFavoriteMoviesAsyncAction
        .run(() => super._fetchFavoriteMovies());
  }

  final _$navigateToDetailAsyncAction =
      AsyncAction('_FavoriteMoviesViewModel.navigateToDetail');

  @override
  Future<dynamic> navigateToDetail(MovieResponse movieResponse) {
    return _$navigateToDetailAsyncAction
        .run(() => super.navigateToDetail(movieResponse));
  }

  @override
  String toString() {
    return '''
favoriteMovies: ${favoriteMovies},
state: ${state}
    ''';
  }
}
