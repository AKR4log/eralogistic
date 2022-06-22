import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<bool> setId(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('id', value);
}

Future<String> getId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('id');
}

Future<bool> setPhone(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('phone', value);
}

Future<String> getPhone() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('phone');
}

Future<bool> setPassword(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('password', value);
}

Future<String> getPassword() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('password');
}

Future<bool> setName(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('name', value);
}

Future<String> getName() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('name');
}

getToken() async {
  final res = await http
      .post(Uri.parse('https://epohalogistic.kz/api/sanctum/register'), body: {
    "name": getRandString(10).toString(),
    "password": getRandString(7).toString(),
    "email": getRandString(20).toString(),
    "device_name": getRandString(15).toString()
  }, headers: {
    'Accept': 'application/json',
  });
  if (res.statusCode == 200) {
    return json.decode(res.body);
  }
}

String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
