import 'dart:convert';

import 'package:eralogistic/app/service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<List<dynamic>> getNewNotification() async {
  var id = await getId();
  var token = await getToken();
  final res = await http.get(
      Uri.parse('https://epohalogistic.kz/api/get-notifications/$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token['token']}'
      });
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    var rest = data["data"];
    return rest;
  }
  return null;
}

readNotifications() async {
  var id = await getId();
  var token = await getToken();
  final res = await http.post(
      Uri.parse('https://epohalogistic.kz/api/read-notifications/$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token['token']}'
      });
  if (res.statusCode == 200) {
    var data = json.decode(res.body);

    return data;
  }
}
