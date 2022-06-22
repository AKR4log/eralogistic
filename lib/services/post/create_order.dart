// api/new-order

// ignore_for_file: non_constant_identifier_names

import 'package:eralogistic/ui/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../storage.dart';

createOrder(
    String waypoint_id, String name, String phone, BuildContext context) async {
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Profile()));
  }
}
