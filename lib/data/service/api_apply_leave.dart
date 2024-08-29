import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/applyLeave.dart';

class ApplyLeave {
  final String baseUri = "https://api.1011.co.id";

  Future<Applyleave> fatchDataApplyLeave(String descrip, String startdate,
      String enddate, String leavetype) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');
      var employee_id = prefs.getString('employee_id');

      final Uri url =
          Uri.parse('$baseUri/attendance/$company_id/leave-request');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token', // Tambahkan token ke header
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "employee_id": '$employee_id',
          "subs_id": 54,
          "letter_no": "",
          "letter_date": "",
          "leave_id": leavetype,
          "date_start": startdate,
          "date_end": enddate,
          "notes": descrip,
          "leave_status": "APPLY"
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelApplyleave = Applyleave.fromJson(decodedResponse);
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
