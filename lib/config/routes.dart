import 'package:flutter/material.dart';

import 'package:slash_task/core/utils/app_strings.dart';

import 'package:slash_task/features/home/presentation/screens/details_screen.dart';
import 'package:slash_task/features/home/presentation/screens/home_screen.dart';

class Routes {
  static const String initRoute = '/';
  static const String detailsRoute = 'detailsRoute';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.detailsRoute:
        return MaterialPageRoute(
          builder: (context) => const DetailsScreen(),
        );
      default:
        return undefined();
    }
  }

  static Route undefined() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(),
        body: const Text(AppStrings.noRoute),
      ),
    );
  }
}
