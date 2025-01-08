import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/addAttandance.dart';

class ApiAttandanceAdd {
  final String baseUrl = "https://api.1011.co.id";

  Future<ApplyAttandance> fatchDataApplyAttandance(
    String source,
    String lat,
    String long,
    String location,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var company_id = prefs.getString('company_id');
      var employee_id = prefs.getString('employee_id');

      final Uri url = Uri.parse('$baseUrl/attendance/$company_id/face-ai/add');
      String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final response = await http.post(
        url,
        headers: {
          // Tambahkan token ke header
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "company_id": '$company_id',
          "employee_id": '$employee_id',
          "time_work_id": 1,
          "status": "IN",
          "image": source,
          "date_time": '$formattedDate',
          "lat": lat,
          "long": long,
          "location": location,
          "device": 'mobile'
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelApplyAttandance = ApplyAttandance.fromJson(decodedResponse);
        return modelApplyAttandance;
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
