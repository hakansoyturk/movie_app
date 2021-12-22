import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/feature/movie_detail/view/movie_detail_view.dart';
import 'package:movie_app/feature/movies/model/movie_response.dart';
import 'package:movie_app/feature/movies/view/movie_list_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case '/':
        return normalNavigate(const MovieListView(), args.name);
      case "/detail":
        if (args.arguments is MovieResponse && args.arguments != null) {
          return normalNavigate(MovieDetailView(movieResponse: args.arguments as MovieResponse), args.name);
        }
        throw Exception("");
      default:
        return MaterialPageRoute(
          builder: (context) => const MovieListView(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String? pageName) {
    return MaterialPageRoute(builder: (context) => widget, settings: RouteSettings(name: pageName));
  }
}
