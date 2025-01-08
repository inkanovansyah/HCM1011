import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/job_history.dart';

class Jobhistory {
  final String baseUrl = "https://api.1011.co.id";

  Future<JobHistory> fatchDataJobHistor() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');
      var employee_id = prefs.getString('employee_id');

      final Uri url = Uri.parse(
          '$baseUrl/organization/$company_id/employee-work-experience/$employee_id/list-data');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token', // Tambahkan token ke header
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"start": 0, "length": 20}),
      );
      print(response.body);
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelApplyleave = JobHistory.fromJson(decodedResponse);
        return modelApplyleave;
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
