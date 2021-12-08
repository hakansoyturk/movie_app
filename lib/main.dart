import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'feature/movies/view/movie_list_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Center(child: MovieListView()),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: const Color(0xff303030),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Fav"),
          ],
          selectedItemColor: Colors.amber[800],
        ),
      ),
    );
  }
}
