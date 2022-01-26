import 'package:flutter/material.dart';

import 'package:rickandmorthy/screens/screens.dart';

class AppRoutes{
  static const initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    'home'     : (BuildContext context) => const HomeScreen(),
    'details'  : (BuildContext context) => const DetailScreen()
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    return MaterialPageRoute(
      builder: (context) => const HomeScreen()
    );
  }
}