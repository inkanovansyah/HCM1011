import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';

import 'package:hcm1011/data/model/approval_request.dart';

class ApiDeclineLeave {
  final String baseUrl = 'https://api.1011.co.id';

  Future<BossRequest> fetchDataApproval(String idDeclineLeave) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final company_id = prefs.getString('company_id');
      final bos_id = prefs.getString('bos_id');

      final Uri url = Uri.parse(
          '$baseUrl/activities/request/$company_id/employee/leave-approval');

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            {"id": idDeclineLeave, "bos_id": bos_id, "status": "DECLINE"}),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return BossRequest.fromJson(json.decode(response.body));
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
