import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/dalateGoalsetting.dart';

class DeleteGs {
  final String baseUrl = "https://api.1011.co.id";

  Future<DalateGoalSetting> fachdDeletegsDataGs(String idanswer) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var company_id = prefs.getString('company_id');
      var token = prefs.getString('token');
      final Uri url =
          Uri.parse('$baseUrl/kpi/$company_id/answer/$idanswer/delete');

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return DalateGoalSetting.fromJson(responseData);
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
