import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/bookinglist.dart';

class ListBookingApi {
  final String baseUrl = "http://172.16.0.206";

  Future<ListBooking> fatchDataBookingList() async {
    try {
      final Uri url = Uri.parse('$baseUrl/rest-api/public/list-book');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "start": 0,
          "lenght": 3,
        }),
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelListBooking = ListBooking.fromJson(decodedResponse);
        return modelListBooking;
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
