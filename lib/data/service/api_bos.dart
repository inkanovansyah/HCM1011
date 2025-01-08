import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/boss_request.dart';

class ApiBos {
  final String baseUrl = 'https://api.1011.co.id';

  Future<BossRequest> fatchGetBossRequest() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');
      var dept_id = prefs.getString('bos_id');

      final Uri url = Uri.parse(
          '$baseUrl/activities/request/$company_id/dept/leave-request');

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "start": 0,
          "length": 20,
          "search": {"leave_status": "APPLY", "bos_id": dept_id}
        }),
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
      throw FailureException('faild to load');
    }
  }
}
