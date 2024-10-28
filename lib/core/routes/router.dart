import 'package:flutter/material.dart';
import 'package:to_do_app/core/routes/routes.dart';


Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.mainScreen:
      return MaterialPageRoute(
          builder: (context) =>  MainScreen(), settings: routeSettings);
    case AppRoutes.addTaskScreen:
      return MaterialPageRoute(
          builder: (context) =>  const AddTaskScreen(), settings: routeSettings);
    default:
      return MaterialPageRoute(
          builder: (context) =>  MainScreen(), settings: routeSettings);
  }
}
