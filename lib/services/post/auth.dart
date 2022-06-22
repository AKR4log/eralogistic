// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:convert';

import 'package:eralogistic/ui/home/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:eralogistic/services/storage.dart';
import 'package:flutter/material.dart';

auth(String phone, String password, BuildContext context) async {
  var token = await getToken();
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
    return setPhone(json.decode(res.body)['phone'].toString()).whenComplete(
        () => setName(json.decode(res.body)['name'].toString()).whenComplete(
            () => setId(json.decode(res.body)['id'].toString()).whenComplete(
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePage())))));
  }
}
