// api/get-types
// api/get-type/{id}

import 'dart:convert';

import 'package:eralogistic/services/storage.dart';
import 'package:http/http.dart' as http;

getType() async {
  var token = await getToken();
  final res = await http.get(
      Uri.parse('http://logistic.q133ss.beget.tech/api/get-types'),
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

getOneType(int id) async {
  var token = await getToken();
  final res = await http.get(
      Uri.parse('http://logistic.q133ss.beget.tech/api/get-types/$id'),
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
