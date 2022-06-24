// ignore_for_file: unused_local_variable

import 'package:eralogistic/app/enum/auth_s.dart';
import 'package:eralogistic/app/state/app_state.dart';
import 'package:eralogistic/services/post/register_user.dart';
import 'package:eralogistic/services/storage.dart';
import 'package:eralogistic/ui/home/home_page.dart';
import 'package:eralogistic/ui/start_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FeedServiceState extends AppState {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;

  Future getCurrentUser(BuildContext context) async {
    try {
      var isId = await getId();
      if (isId != null && isId != '') {
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

  signInWithCredential(authResult, context) async {
    UserCredential firebaseResult =
        await FirebaseAuth.instance.signInWithCredential(authResult);
    authStatus = AuthStatus.LOGGED_IN;
    register(context);
  }

  signInWithCredentialCompany(authResult, context) async {
    UserCredential firebaseResult =
        await FirebaseAuth.instance.signInWithCredential(authResult);
    authStatus = AuthStatus.LOGGED_IN;
    registerCompany(context);
  }

  signInWithCredentialPrivate(authResult, context) async {
    UserCredential firebaseResult =
        await FirebaseAuth.instance.signInWithCredential(authResult);
    authStatus = AuthStatus.LOGGED_IN;
    registerPrivate(context);
  }
}
