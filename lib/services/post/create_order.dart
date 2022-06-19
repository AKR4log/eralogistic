// api/new-order

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../storage.dart';

createOrder(
    String waypoint_id, String user_id, String name, String phone) async {
  var token = await getToken();
  final res = await http.post(
      Uri.parse('http://logistic.q133ss.beget.tech/api/new-order'),
      body: {
        "waypoint_id": waypoint_id,
        "user_id": user_id,
        "name": name,
        "phone": phone
      },
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
