// api/get-orders
// api/get-order/{id}
// api/get-user-orders/{user_id}

import 'dart:convert';

import 'package:eralogistic/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

getOrdersUser() async {
  List pop = [];
  var id = await getId();
  var token = await getToken();
  final res = await http.get(
      Uri.parse('https://epohalogistic.kz/api/get-user-orders/$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token['token']}'
      });
  if (res.statusCode == 200) {
    var data = json.decode(res.body) as List;
    debugPrint(data.toString());

    return data;
  }
}
