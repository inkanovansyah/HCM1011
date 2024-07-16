import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/sand_goal_setting.dart';

class CreateGs {
  final String baseUrl = "https://api.1011.co.id";
  Future<SandGoalSetting> fachdataGs(
    String jobDesc,
    String bobot,
    String target,
    String satuanTarget,
    String sesionId,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var nik = prefs.getString('nik');
      var company_id = prefs.getString('company_id');
      final Uri url = Uri.parse(
          '$baseUrl/kpi/$company_id/employee/$nik/section/$sesionId/save');
      print(url);
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            "section_id": sesionId, //ambil dari kpi sesion
            "jobs_desc": jobDesc, //title detail dari form
            "target": target, //target
            "satuan_target": satuanTarget,
            "actual": 0,
            "satuan_actual": satuanTarget,
            "weightage": bobot, //bobot
            "direct": 0,
            "self_rating": 0,
            "goal_self_submit": 0,
            "goal_approval_submit": 0
          },
        ),
      );
      print(response.body);
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
      print('Error nih: $e');
      throw FailureException('faild to load');
    }
  }
}
