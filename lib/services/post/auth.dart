import 'dart:convert';

import 'package:eralogistic/ui/home/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:eralogistic/services/storage.dart';
import 'package:flutter/material.dart';

auth(String phone, String password, BuildContext context) async {
  final res = await http
      .post(Uri.parse('http://logistic.q133ss.beget.tech/login'), body: {
    "phone": phone,
    "password": password
  }, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer 2|X693ubFy01PuOtWRjzT2AhPsGuflhHVHGaPWRmHo'
  });
  print(res.statusCode);
  if (res.statusCode == 200) {
    print(json.decode(res.body));
    return setIsAuth('auth').whenComplete(() => Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage())));
  }
}
