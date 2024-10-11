import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/editGoalSetting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiEditGs {
  final String baseUri = "https://api.1011.co.id";

  Future<SandGoalSetting> fachdataGs(String goalsetting_id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');

      final Uri url =
          Uri.parse('$baseUri/kpi/$company_id/answer/$goalsetting_id/detail');

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({}),
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelListInfo = SandGoalSetting.fromJson(decodedResponse);

        return modelListInfo;
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response are not success');
      }
    } on SocketException {
      throw FailureException('no internet Connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException('faild to load list date by date $goalsetting_id');
    }
  }
}
