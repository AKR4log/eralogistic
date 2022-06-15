// ignore_for_file: missing_return

import 'package:eralogistic/app/routes/anim_routes.dart';
import 'package:eralogistic/ui/home/connect/connect.dart';
import 'package:eralogistic/ui/home/home_page.dart';
import 'package:eralogistic/ui/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  static dynamic route() {
    return {
      'SplashPage': (BuildContext context) => SplashPage(),
    };
  }

  static Route onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      case "HomePage":
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => const HomePage());
        break;
      case "ConnectPage":
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => const ConnectPage());
        break;
    }
  }
}
