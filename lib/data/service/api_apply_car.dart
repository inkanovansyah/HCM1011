import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/appCar.dart';

class ApplyCarApi {
  final String baseUrl = "http://172.16.0.73";

  Future<AppCar> fatchDataApplyCar(
    String id,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      final Uri url =
          Uri.parse('$baseUrl/rest-api/public/list-book/update-status/$id');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token', // Tambahkan token ke header
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {"is_active": 0, "bookingmobil_id": id},
        ),
      );

      // print('Response: ${response.body}');

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelApplyCar = AppCar.fromJson(decodedResponse);
        return modelApplyCar;
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
