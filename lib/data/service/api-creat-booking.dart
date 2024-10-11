import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/applyCarBooking.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplyCarBooking {
  final String baseUri = "http://172.16.0.206";

  Future<ListtransaksiBooking> fatchDataApplyCarBooking(
      String deskripsi, String bookingStart, String bookingEnd) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var employee_id = prefs.getString('employee_id');
      var name = prefs.getString('fullname');
      final Uri url =
          Uri.parse('$baseUri/rest-api/public/list-book/carlist/save');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "bookingmobil_id": '1',
          "employee_id": '$employee_id',
          "nama_pengguna": '$name',
          "Deskripsi": '$deskripsi',
          "booking_start": '$bookingStart',
          "booking_end": '$bookingEnd',
          "is_active": '1'
        }),
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelApplyCarBooking =
            ListtransaksiBooking.fromJson(decodedResponse);

        return modelApplyCarBooking;
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response are not success');
      }
    } on SocketException {
      throw FailureException('no internet Connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException(
          'Booking range conflicts with an existing booking.');
    }
  }
}
