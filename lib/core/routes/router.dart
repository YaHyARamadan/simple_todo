import 'package:flutter/material.dart';
import 'package:to_do_app/core/routes/routes.dart';

import '../../features/main_screen/view/main_screen.dart';


Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.mainScreen:
      return MaterialPageRoute(
          builder: (context) =>  const MainScreen(), settings: routeSettings);

    default:
      return MaterialPageRoute(
          builder: (context) =>  MainScreen(), settings: routeSettings);
  }
}
