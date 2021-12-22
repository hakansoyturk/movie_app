import 'package:flutter/cupertino.dart';

import 'INavigationService.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();

  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Future<void> navigateToPage({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: data);
  }
}
