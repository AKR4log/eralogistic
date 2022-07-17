import 'dart:convert';

import 'package:eralogistic/app/service.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List> getUserSuggestions(String query) async {
    var token = await getToken();
    final res = await http
        .get(Uri.parse('https://epohalogistic.kz/api/get-types'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token['token']}'
    });
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["data"];

      return rest.map((user) {
        final nameLower = user['name'].toLowerCase();
        final queryLower = query.toLowerCase();
        if (nameLower.contains(queryLower)) {
          return user;
        }
        return false;
      }).toList();
    } else {
      throw Exception();
    }
  }
}
