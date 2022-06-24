// ignore_for_file: missing_return

import 'package:eralogistic/app/routes/anim_routes.dart';
import 'package:eralogistic/ui/connect/comfirm_code.dart';
import 'package:eralogistic/ui/connect/comfirm_code_Private.dart';
import 'package:eralogistic/ui/connect/comfirm_code_company.dart';
import 'package:eralogistic/ui/connect/login.dart';
import 'package:eralogistic/ui/connect/register.dart';
import 'package:eralogistic/ui/home/home_page.dart';
import 'package:eralogistic/ui/home/notifications.dart';
import 'package:eralogistic/ui/home/profile.dart';
import 'package:eralogistic/ui/home/workshop/register_private.dart';
import 'package:eralogistic/ui/home/workshop/register_transport.dart';
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
      case "Profile":
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => const Profile());
        break;
      case "Notifications":
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => const Notifications());
        break;
      case "RegisterTransport":
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => const RegisterTransport());
        break;
      case "RegisterPrivate":
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => const RegisterPrivate());
        break;

      case "ComfirmCode":
        String verificationID = pathElements[2];
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) =>
                ComfirmCode(verificationID: verificationID));
        break;
      case "ComfirmCodeConfirm":
        String verificationID = pathElements[2];
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) =>
                ComfirmCodeCompany(verificationID: verificationID));
        break;
      case "ComfirmCodePrivate":
        String verificationID = pathElements[2];
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) =>
                ComfirmCodePrivate(verificationID: verificationID));
        break;
    }
  }
}
