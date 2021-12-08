import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/commons/view/list/movie_grid_list_view.dart';
import 'package:movie_app/core/base_view.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';
import 'package:movie_app/feature/movies/service/movie_service_impl.dart';
import 'package:movie_app/feature/movies/viewmodel/movie_list_view_model.dart';
import 'package:movie_app/util/context_ext.dart';

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
              backgroundColor: const Color(0xff303030),
              appBar: buildAppBar(context, viewModel),
              body: buildObserverMoviesBody(context, viewModel)),
    );
  }

  Observer buildObserverMoviesBody(
      BuildContext context, MovieListViewModel viewModel) {
    return Observer(builder: (_) {
      return viewModel.isPageLoading
          ? SizedBox(
              height: context.dynamicHeight(0.1),
              child: Align(
                  alignment: Alignment.center, child: buildCenterLoading()))
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "Recently Released",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Open Sans",
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 16),
                  MovieGridListView(
                    models: viewModel.filteredList,
                    onPressed: (MovieResponse item, int index) {
                      // TODO Navigate to detail
                    },
                  ),
                ],
              ),
            );
    });
  }

  AppBar buildAppBar(BuildContext context, MovieListViewModel viewModel) {
    return AppBar(
      title: const Align(
        alignment: Alignment.center,
        child: Text("Movies"),
      ),
      backgroundColor: const Color(0xff303030),
      actions: [
        IconButton(
            icon: const Icon(Icons.filter),
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: const Color(0xff303030),
                  context: context,
                  builder: (context) => buildGenresList(viewModel));
            })
      ],
    );
  }

  ListView buildGenresList(MovieListViewModel viewModel) {
    return ListView.builder(
        itemCount: viewModel.genresList.length,
        itemBuilder: (context, index) => MaterialButton(
            color: const Color(0xff303030),
            height: context.dynamicHeight(0.08),
            child: Text(
              viewModel.genresList[index].name!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "Public Sans",
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {
              viewModel
                  .filterList(viewModel.filteredList[index].genreIds!.first);
            }));
  }

  Center buildCenterLoading() =>
      const Center(child: CircularProgressIndicator.adaptive());
}
