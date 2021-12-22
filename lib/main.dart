import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'core/navigation/navigation_route.dart';
import 'core/navigation/navigation_service.dart';
import 'feature/favourites/view/favorite_movies_view.dart';
import 'feature/movies/view/movie_list_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.signInAnonymously();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyAppState(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}

class MyAppState extends StatefulWidget {
  const MyAppState({Key? key}) : super(key: key);

  @override
  State<MyAppState> createState() => _MyApp();
}

class _MyApp extends State<MyAppState> {
  static const List<Widget> _widgetOptions = <Widget>[
    MovieListView(),
    FavoriteMoviesView()
  ];
  int _selectedIndex = 0;

  void _onBottomBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: const Color(0xff303030),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Fav")
        ],
        currentIndex: _selectedIndex,
        onTap: _onBottomBarItemTapped,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
