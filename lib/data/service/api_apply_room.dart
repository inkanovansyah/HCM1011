import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/applyRoom.dart';

class ApplyRoomApi {
  final String baseUrl = "https://api.1011.co.id";

  Future<ApplyRoom> fatchDataApplyRoom(
    String room,
    String title,
    String descrip,
    String startdate,
    String enddate,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');
      var employee_id = prefs.getString('employee_id');

      final Uri url =
          Uri.parse('$baseUrl/activities/request/$company_id/room-meeting/add');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token', // Tambahkan token ke header
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            "room_id": room,
            "title": title,
            "description": descrip,
            "location": "",
            "start_date": startdate,
            "end_date": enddate,
            "employee_id": employee_id
          },
        ),
      );
      print(response.body);
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelApplyRoom = ApplyRoom.fromJson(decodedResponse);
        print('Booking successful: ${modelApplyRoom.messages}');
        return modelApplyRoom;
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response are not success');
      }
    } on SocketException {
      throw FailureException('no internet Connection');
    } catch (e) {
      print('Error : $e');
      throw FailureException(
          'Booking range conflicts with an existing booking.');
    }
  }
}
