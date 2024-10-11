import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationList {
  final String baseUri = "https://api.1011.co.id";

  Future<ListNotifikasion> fatchDataNotificationList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');
      var employee_id = prefs.getString('employee_id');

      final Uri url = Uri.parse('$baseUri/activities/$company_id/list-data');

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body:
            jsonEncode({"employee_id": employee_id, "start": 0, "length": 10}),
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelNotification = ListNotifikasion.fromJson(decodedResponse);
        return modelNotification;
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response are not success');
      }
    } on SocketException {
      throw FailureException('no internet Connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException('failed to load');
    }
  }
}
