import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/applyUpdateGoalSetting.dart';

class UpdateGs {
  final String baseUrl = "https://api.1011.co.id";

  Future<SandUpdateGoalSetting> fachdataGs(
    String sectionId,
    String formId,
    String jobDesc,
    String target,
    String bobot,
    String satuanActual,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var nik = prefs.getString('nik');
      var companyid = prefs.getString('company_id');
      final Uri url = Uri.parse(
          '$baseUrl/kpi/$companyid/employee/$nik/section/KPI2024-JUL-ST/update');
      print('url: $url');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            "section_id": sectionId,
            "id": formId,
            "jobs_desc": jobDesc,
            "target": target,
            "satuan_target": satuanActual,
            "actual": 0,
            "satuan_actual": satuanActual,
            "level1_value": 0,
            "weightage": bobot,
            "direct": 0,
            "self_rating": 0,
            "self_value": 0,
            "self_value_week": [
              {"week": 1, "value": 0},
              {"week": 2, "value": 0},
              {"week": 3, "value": 0},
              {"week": 4, "value": 0},
              {"week": 5, "value": 0}
            ]
          },
        ),
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelListInfo = SandUpdateGoalSetting.fromJson(decodedResponse);

        return modelListInfo;
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response are not success');
      }
    } on SocketException {
      throw FailureException('no internet Connection');
    } catch (e) {
      print('Error ini: $e');
      throw FailureException('faild to load list date by date $formId');
    }
  }
}
