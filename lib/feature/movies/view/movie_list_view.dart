import 'package:flutter/material.dart';
import 'package:movie_app/core/base_view.dart';
import 'package:movie_app/feature/movies/service/movie_service_impl.dart';
import 'package:movie_app/feature/movies/viewmodel/movie_list_view_model.dart';
import 'package:firebase_database/firebase_database.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MovieListViewModel>(
      viewModel: MovieListViewModel(
          MovieServiceImpl(FirebaseDatabase.instance.reference())),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, MovieListViewModel viewModel) =>
          Scaffold(
        body: Center(
          child: Text(viewModel.moviesList.toString()),
        ),
      ),
    );
  }
}
