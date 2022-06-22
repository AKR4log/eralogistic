// api/find-transport/{type_id}/{from_id}/{to_id}

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:eralogistic/services/storage.dart';
import 'package:http/http.dart' as http;

searchAuto(String type_id, String from_id, String to_id) async {
  var token = await getToken();
  final res = await http.post(
      Uri.parse(
          'https://epohalogistic.kz/api/find-transport/$type_id/$from_id/$to_id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token['token']}'
      });
  print(res.statusCode);
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    var rest = data["data"] as List;
    print(rest);

    return rest;
  }
}
