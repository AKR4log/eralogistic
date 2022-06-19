import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<bool> setIsAuth(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('bool', value);
}

Future<String> getIsAuth() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('bool');
}

getToken() async {
  final res = await http.post(
      Uri.parse('http://logistic.q133ss.beget.tech/api/sanctum/register'),
      body: {
        "name": getRandString(10).toString(),
        "password": getRandString(7).toString(),
        "email": getRandString(20).toString(),
        "device_name": getRandString(15).toString()
      },
      headers: {
        'Accept': 'application/json',
      });
  if (res.statusCode == 200) {
    print(res.body);
    return json.decode(res.body);
  }
}

String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
