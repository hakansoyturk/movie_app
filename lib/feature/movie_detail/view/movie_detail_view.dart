import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/core/base_view.dart';
import 'package:movie_app/core/constant.dart';
import 'package:movie_app/feature/movie_detail/service/movie_service_impl.dart';
import 'package:movie_app/feature/movie_detail/viewmodel/movie_detail_view_model.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({Key? key, required this.movieResponse})
      : super(key: key);

  final MovieResponse movieResponse;

  @override
  Widget build(BuildContext context) {
    return BaseView<MovieDetailViewModel>(
        viewModel: MovieDetailViewModel(
            MovieDetailServiceImpl(FirebaseDatabase.instance.reference())),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
          model.isAddedToFavorite(movieResponse);
        },
        onPageBuilder: (BuildContext context, MovieDetailViewModel viewModel) =>
            Scaffold(
                backgroundColor: const Color(0xff303030),
                appBar: buildAppBar(context),
                body: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                                Constant.MOVIE_IMAGES_BASE_URL +
                                    movieResponse.posterPath!,
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width,
                                height: 300),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(movieResponse.title ?? "",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(movieResponse.genreIds.toString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 10)),
                                    Text(movieResponse.releaseDate ?? "",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 10),
                                        textAlign: TextAlign.end)
                                  ],
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(movieResponse.overview ?? "",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                          Observer(
                              builder: (_) => FloatingActionButton(
                                  child: viewModel.isFavorite
                                      ? const Icon(Icons.add)
                                      : const Icon(Icons.delete),
                                  onPressed: () {
                                    viewModel.changeFavState(movieResponse);
                                    viewModel.isAddedToFavorite(movieResponse);
                                  }))
                        ]))));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: const Text("Movie Detail"),
        backgroundColor: const Color(0xff303030));
  }
}
