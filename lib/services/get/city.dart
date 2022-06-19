// api/get-cities
// api/get-city/{id}

import 'dart:convert';

import 'package:eralogistic/services/storage.dart';
import 'package:http/http.dart' as http;

getCity() async {
  var token = await getToken();
  final res = await http.get(
      Uri.parse('http://logistic.q133ss.beget.tech/api/get-cities'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token['token']}'
      });
  print(res.statusCode);
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    var rest = data["data"] as List;

    return rest;
  }
}

getOneCity(int id) async {
  var token = await getToken();
  final res = await http.get(
      Uri.parse('http://logistic.q133ss.beget.tech/api/get-cities/$id'),
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
