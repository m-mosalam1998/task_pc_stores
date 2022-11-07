import 'package:flutter/material.dart';
import 'package:task_pc_stores/view/home/home.dart';
import 'package:task_pc_stores/view/registration/registartion.dart';

import 'routes_name.dart';

class AppRouts {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesName.registration:
        return MaterialPageRoute(builder: (_) => const Registration());
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const Home());
      default:
    }
  }
}
