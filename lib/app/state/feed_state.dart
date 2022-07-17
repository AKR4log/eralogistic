// ignore_for_file: unused_local_variable, prefer_function_declarations_over_variables, non_constant_identifier_names, missing_return

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:eralogistic/app/enum/auth_s.dart';
import 'package:eralogistic/app/notification.dart';
import 'package:eralogistic/app/service.dart';
import 'package:eralogistic/app/state/app_state.dart';
import 'package:eralogistic/ui/home/home_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
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
    return Navigator.pushReplacementNamed(context, "/HomePage");
  }

  signInWithCredentialCompany(authResult, context) async {
    UserCredential firebaseResult =
        await FirebaseAuth.instance.signInWithCredential(authResult);
    authStatus = AuthStatus.LOGGED_IN;
    return Navigator.pushReplacementNamed(context, "/SpecialPage");
  }

  signInWithCredentialPrivate(authResult, context) async {
    UserCredential firebaseResult =
        await FirebaseAuth.instance.signInWithCredential(authResult);
    authStatus = AuthStatus.LOGGED_IN;
    return Navigator.pushReplacementNamed(context, "/SpecialPage");
  }

  Future<String> auth(
      String phone, String password, BuildContext context) async {
    var token = await getToken();
    authStatus = AuthStatus.NOT_LOGGED_IN;

    final res = await http.post(Uri.parse('https://epohalogistic.kz/api/login'),
        body: {
          "phone": phone,
          "password": password,
          "device_name": "web"
        },
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token['token']}'
        });
    if (res.statusCode == 200) {
      final response = await http.get(
          Uri.parse(
              'https://epohalogistic.kz/api/get-user/${json.decode(res.body)['id'].toString()}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${token['token']}'
          });
      setPhone(json.decode(res.body)['phone'].toString()).whenComplete(() =>
          setName(json.decode(res.body)['name'].toString()).whenComplete(() =>
              setId(json.decode(res.body)['id'].toString()).whenComplete(
                  () => Navigator.pushReplacementNamed(context, "/HomePage"))));
    }
    if (res.statusCode == 422) {
      authStatus = AuthStatus.PASSWORD_REQUIRED;
      return "422";
    }
    if (res.statusCode == 503) {
      authStatus = AuthStatus.LOGIN_INVALID;
      return "503";
    }
    if (res.statusCode == 504) {
      authStatus = AuthStatus.PHONE_NOT_EXIST;
      return "504";
    }
  }

  createOrder(String waypoint_id, String name, String phone,
      BuildContext context) async {
    var idUser = await getId();
    var token = await getToken();
    final res = await http
        .post(Uri.parse('https://epohalogistic.kz/api/new-order'), body: {
      "waypoint_id": waypoint_id,
      "user_id": idUser,
      "name": name,
      "phone": phone
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token['token']}'
    });
    if (res.statusCode == 200) {
      const snackBar = SnackBar(
        content: Text('Заявка успешно подана, ожидайте ответа'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> verifyPhone(context, phoneNumber) async {
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential authResult) async {};

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {};

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {};

    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId) {
      Navigator.of(context).pushNamed('/ComfirmCode/' + verId);
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        timeout: const Duration(seconds: 1),
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout);
  }

  Future<void> verifyPhonePrivate(context, phoneNumber) async {
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential authResult) async {};

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {};

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {};

    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId) {
      Navigator.of(context).pushNamed('/ComfirmCodePrivate/' + verId);
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        timeout: const Duration(seconds: 1),
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout);
  }

  Future<void> verifyPhoneCompany(context, phoneNumber) async {
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential authResult) async {};

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {};

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {};

    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId) {
      Navigator.of(context).pushNamed('/ComfirmCodeConfirm/' + verId);
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        timeout: const Duration(seconds: 1),
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout);
  }

  Future<bool> register(
      BuildContext context, String phone, String password) async {
    var token = await getToken();
    authStatus = AuthStatus.NOT_LOGGED_IN;
    var name = getRandString(6).toString();

    final res = await http
        .post(Uri.parse('https://epohalogistic.kz/api/register'), body: {
      "phone": phone,
      "password": password,
      "name": name,
      "device_name": "web"
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token['token']}'
    });
    debugPrint(res.statusCode.toString());
    if (res.statusCode == 201) {
      return setId(json.decode(res.body)['id'].toString()).whenComplete(() =>
          setName(name).whenComplete(() =>
              setPhone(phone).whenComplete(() => verifyPhone(context, phone))));
    }
    if (res.statusCode == 504) {
      return false;
    }
  }

  Future<bool> registerPrivate(BuildContext context, String password,
      String phone, String detail, String fio) async {
    var token = await getToken();
    authStatus = AuthStatus.NOT_LOGGED_IN;

    final res = await http
        .post(Uri.parse('https://epohalogistic.kz/api/create-user'), body: {
      "phone": phone,
      "password": password,
      "name": fio,
      "role_id": "4",
      "requisites": detail,
      "device_name": "web"
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token['token']}'
    });
    debugPrint(res.statusCode.toString());
    if (res.statusCode == 201) {
      verifyPhonePrivate(context, phone);
    }
    if (res.statusCode == 504) {
      return false;
    }
  }

  Future<bool> registerCompany(
      BuildContext context,
      String password,
      String phone,
      String name,
      String contact,
      String details,
      String tenge,
      String usd) async {
    var token = await getToken();
    authStatus = AuthStatus.NOT_LOGGED_IN;

    final res = await http
        .post(Uri.parse('https://epohalogistic.kz/api/create-user'), body: {
      "name": getRandString(6).toString(),
      "password": password,
      "company": name,
      "contact_face": contact,
      "phone": phone,
      "requisites": details,
      "tenge_account": tenge,
      "role_id": "2",
      "usd_account": usd,
      "device_name": "web"
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token['token']}'
    });
    debugPrint(res.statusCode.toString());
    if (res.statusCode == 201) {
      verifyPhoneCompany(context, phone);
    }
    if (res.statusCode == 504) {
      return false;
    }
  }

  searchAuto(String type_id, String from_id, String to_id) async {
    var token = await getToken();
    final res = await http.post(
        Uri.parse(
            'https://epohalogistic.kz/api/find-transport/$type_id/$from_id/$to_id'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token['token']}'
        });
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["data"] as List;

      return rest;
    }
  }

  getAllNotification() async {
    var id = await getId();
    var token = await getToken();
    final res = await http.get(
        Uri.parse('https://epohalogistic.kz/api/get-all-notifications/$id'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token['token']}'
        });
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["data"] as List;

      return rest.reversed;
    }
  }

  getOrdersUser() async {
    var id = await getId();
    var token = await getToken();
    final res = await http.get(
        Uri.parse('https://epohalogistic.kz/api/get-user-orders/$id'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token['token']}'
        });
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["data"] as List;

      return rest;
    }
  }
}
