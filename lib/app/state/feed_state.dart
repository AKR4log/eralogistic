import 'package:eralogistic/app/enum/auth_s.dart';
import 'package:eralogistic/app/state/app_state.dart';
import 'package:eralogistic/services/storage.dart';
import 'package:eralogistic/ui/home/home_page.dart';
import 'package:eralogistic/ui/start_page.dart';
import 'package:flutter/material.dart';

class FeedServiceState extends AppState {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;

  Future getCurrentUser(BuildContext context) async {
    try {
      var isAuth = 'await getIsAuth()';
      if (isAuth != null && isAuth != '') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        authStatus = AuthStatus.LOGGED_IN;
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const StartPage()));
        authStatus = AuthStatus.NOT_LOGGED_IN;
      }
      isBusy = true;
    } catch (error) {
      isBusy = false;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      return null;
    }
  }
}
