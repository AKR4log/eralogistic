// ignore_for_file: missing_return

import 'package:eralogistic/app/routes/anim_routes.dart';
import 'package:eralogistic/ui/connect/login.dart';
import 'package:eralogistic/ui/connect/register.dart';
import 'package:eralogistic/ui/home/home_page.dart';
import 'package:eralogistic/ui/splash.dart';
import 'package:eralogistic/ui/start_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static dynamic route() {
    return {
      'SplashPage': (BuildContext context) => const SplashPage(),
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
      case "StartPage":
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => const StartPage());
        break;
      case "LoginPage":
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => const LoginPage());
        break;
      case "RegisterPage":
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => const RegisterPage());
        break;
    }
  }
}
