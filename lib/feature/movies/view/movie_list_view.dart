import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/commons/view/list/movie_grid_list_view.dart';
import 'package:movie_app/core/base_view.dart';
import 'package:movie_app/feature/movies/service/movie_service_impl.dart';
import 'package:movie_app/feature/movies/viewmodel/movie_list_view_model.dart';
import 'package:movie_app/util/context_ext.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MovieListViewModel>(
      viewModel: MovieListViewModel(MovieServiceImpl(FirebaseDatabase.instance.reference())),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, MovieListViewModel viewModel) => Container(
        padding: context.paddingLow,
        child: Scaffold(appBar: buildAppBar(), body: buildObserverMoviesBody(context, viewModel)),
      ),
    );
  }

  Observer buildObserverMoviesBody(BuildContext context, MovieListViewModel viewModel) {
    return Observer(builder: (_) {
      return viewModel.isPageLoading
          ? SizedBox(
              height: context.dynamicHeight(0.1), child: Align(alignment: Alignment.center, child: buildCenterLoading()))
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "Recently Released",
                    style: TextStyle(fontSize: 24, fontFamily: "Open Sans", fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 16),
                  MovieGridListView(models: viewModel.moviesList),
                ],
              ),
            );
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Align(
        alignment: Alignment.center,
        child: Text("Movies"),
      ),
      backgroundColor: Colors.transparent,
      elevation: 2,
      actions: [IconButton(icon: const Icon(Icons.filter), onPressed: () {})],
    );
  }

  Center buildCenterLoading() => const Center(child: CircularProgressIndicator.adaptive());
}
