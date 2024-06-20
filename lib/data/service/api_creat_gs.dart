import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/sand_goal_setting.dart';

class CreateGs {
  final String baseUrl = "https://api.1011.co.id";
  Future<SandGoalSetting> fachdataGs(
    String jobs_desc,
    String target,
    String satuan_target,
    String section,
    String code_section,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var nik = prefs.getString('nik');
      var employee_id = prefs.getString('employee_id');
      final Uri url = Uri.parse(
          '$baseUrl/kpi/$employee_id/employee/$nik/$code_section//save');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "section_id": section,
          "id": "0",
          "jobs_desc": jobs_desc,
          "target": target,
          "satuan_target": satuan_target,
          "actual": 0,
          "satuan_actual": satuan_target,
          "weightage": "5",
          "direct": 0,
          "self_rating": 0,
          "goal_self_submit": 0,
          "goal_approval_submit": 0
        }),
      );
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelListInfo = SandGoalSetting.fromJson(decodedResponse);

        return modelListInfo;
        // return ModelListInfo.fromJson(decodedResponse);
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
