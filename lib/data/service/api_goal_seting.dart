import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/model_goal_setting.dart';

class GoalSettingList {
  final String baseUrl = "https://api.1011.co.id";
  Future<ModelGoalSetting> factchGoal() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var company_id = prefs.getString('company_id');
      var employee_id = prefs.getString('employee_id');
      var nik = prefs.getString('nik');
      var token = prefs.getString('token');
      // var code = prefs.getString('id');
      // var section_id = prefs.getString('section_id');

      final Uri url = Uri.parse(
          '$baseUrl/kpi/$company_id/employee/$nik/section/KPI2024-MEI-ST/answer/177');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "employee_id": employee_id,
          "start": 0,
          "length": 50,
        }),
      );
      // print(response.body);
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelListInfo = ModelGoalSetting.fromJson(decodedResponse);

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
