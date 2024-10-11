import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/booking.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingList {
  final String baseUri = "https://api.1011.co.id";

  Future<BookingRoom> fatchDataBookingList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');

      final Uri url =
          Uri.parse('$baseUri/activities/request/$company_id/room-meeting');

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "start": 0,
          "length": 100,
        }),
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelBookingRoom = BookingRoom.fromJson(decodedResponse);
        return modelBookingRoom;
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
