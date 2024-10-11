import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/model_delete_br.dart';

class ApiDeleteBookingRoom {
  final String baseUrl = 'https://api.1011.co.id';

  Future<ApplyDeleteRoom> deleteBookingRoom(String id, String roomid) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');
      var employee_id = prefs.getString('employee_id');

      final Uri url = Uri.parse(
          '$baseUrl/activities/request/$company_id/room-meeting/delete');

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            {"id": id, "room_id": roomid, "employee_id": '$employee_id'}),
      );
      if (response.statusCode == 200) {
        return ApplyDeleteRoom.fromJson(json.decode(response.body));
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
