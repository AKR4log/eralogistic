// api/create-user
// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:convert';

import 'package:eralogistic/ui/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:eralogistic/services/storage.dart';
import 'package:flutter/material.dart';

Future<void> verifyPhone(phoneNumber, password, context) async {
  final PhoneVerificationCompleted verificationCompleted =
      (AuthCredential authResult) async {
    return setPhone(phoneNumber).whenComplete(() => setPassword(password)
        .whenComplete(
            () => Navigator.pushReplacementNamed(context, "/HomePage")));
  };

  final PhoneVerificationFailed verificationFailed =
      (FirebaseAuthException authException) {};

  final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
    // this.verificationID = verId;
    // setState(() {
    //   errorWait = false;
    //   wait = true;
    // });
  };

  final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId) {
    return setPhone(phoneNumber).whenComplete(() => setPassword(password)
        .whenComplete(
            () => Navigator.of(context).pushNamed('/ComfirmCode/' + verId)));
  };

  await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      timeout: const Duration(seconds: 5),
      verificationFailed: verificationFailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoRetrievalTimeout);
}

register(BuildContext context) async {
  var password = await getPassword();
  var phone = await getPhone();
  var token = await getToken();

  final res = await http
      .post(Uri.parse('https://epohalogistic.kz/api/register'), body: {
    "phone": phone,
    "password": password,
    "name": getRandString(6).toString(),
    "device_name": "web"
  }, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${token['token']}'
  });
  if (res.statusCode == 201) {
    return setId(json.decode(res.body)['id'].toString()).whenComplete(() =>
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }
}
