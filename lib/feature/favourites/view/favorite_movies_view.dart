import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/commons/view/list/movie_grid_list_view.dart';
import 'package:movie_app/core/base_view.dart';
import 'package:movie_app/feature/favourites/service/favorite_movie_service_impl.dart';
import 'package:movie_app/feature/favourites/viewmodel/favorite_movies_view_model.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';
import 'package:movie_app/util/store_state.dart';

class FavoriteMoviesView extends StatelessWidget {
  const FavoriteMoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FavoriteMoviesViewModel>(
        viewModel: FavoriteMoviesViewModel(
            FavoriteMovieServiceImpl(FirebaseDatabase.instance.reference())),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder:
            (BuildContext context, FavoriteMoviesViewModel viewModel) =>
                Scaffold(
                  backgroundColor: const Color(0xff303030),
                  appBar: buildAppBar(context, viewModel),
                  body: Observer(builder: (_) {
                    switch (viewModel.state) {
                      case StoreState.loaded:
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                const SizedBox(height: 16),
                                MovieGridListView(
                                    models: viewModel.favoriteMovies,
                                    onPressed: (MovieResponse item, int index) {
                                      viewModel.navigateToDetail(item);
                                    })
                              ],
                            ),
                          ),
                        );
                      default:
                        return buildCenterLoading();
                    }
                  }),
                ));
  }

  AppBar buildAppBar(BuildContext context, FavoriteMoviesViewModel viewModel) {
    return AppBar(
      title: const Align(
        alignment: Alignment.center,
        child: Text("Favorite Movies"),
      ),
      backgroundColor: const Color(0xff303030),
    );
  }

  Center buildCenterLoading() =>
      const Center(child: CircularProgressIndicator.adaptive());
}
