// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailViewModel on _MovieDetailViewModel, Store {
  final _$isFavoriteAtom = Atom(name: '_MovieDetailViewModel.isFavorite');

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  final _$changeFavStateAsyncAction =
      AsyncAction('_MovieDetailViewModel.changeFavState');

  @override
  Future<void> changeFavState(MovieResponse movieResponse) {
    return _$changeFavStateAsyncAction
        .run(() => super.changeFavState(movieResponse));
  }

  final _$isAddedToFavoriteAsyncAction =
      AsyncAction('_MovieDetailViewModel.isAddedToFavorite');

  @override
  Future<void> isAddedToFavorite(MovieResponse movieResponse) {
    return _$isAddedToFavoriteAsyncAction
        .run(() => super.isAddedToFavorite(movieResponse));
  }

  @override
  String toString() {
    return '''
isFavorite: ${isFavorite}
    ''';
  }
}
