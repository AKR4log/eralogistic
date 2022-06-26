import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> setId(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('id', value);
}

String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
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

Future<bool> setCompanyName(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('CompanyName', value);
}

Future<String> getCompanyName() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('CompanyName');
}

Future<bool> setYears(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('Years', value);
}

Future<String> getYears() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('Years');
}

Future<bool> setContactPerson(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('ContactPerson', value);
}

Future<String> getContactPerson() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('ContactPerson');
}

Future<bool> setMail(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('Mail', value);
}

Future<String> getMail() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('Mail');
}

Future<bool> setWorking(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('Working', value);
}

Future<String> getWorking() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('Working');
}

Future<bool> setAddress(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('Address', value);
}

Future<String> getAddress() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('Address');
}

Future<bool> setDetails(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('Details', value);
}

Future<String> getDetails() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('Details');
}

Future<bool> setTengeAccount(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('TengeAccount', value);
}

Future<String> getTengeAccount() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('TengeAccount');
}

Future<bool> setUSDAccount(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('USDAccount', value);
}

Future<String> getUSDAccount() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('USDAccount');
}

Future<bool> setBIN(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('BIN', value);
}

Future<String> getBIN() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('BIN');
}
