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
    String updateGoalSetting,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var nik = prefs.getString('nik');
      var companyid = prefs.getString('company_id');

      final Uri urlSection =
          Uri.parse('$baseUrl/kpi/$companyid/employee/$nik/list');

      // Request untuk mendapatkan data section
      final responseSection = await http.post(
        urlSection,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"is_active": 1}),
      );

      if (responseSection.statusCode == 200) {
        final decodedResponse = json.decode(responseSection.body);
        var sectionkpi;

        // Memastikan struktur JSON sesuai dengan ekspektasi
        if (decodedResponse.containsKey('data') &&
            decodedResponse['data'] is Map<String, dynamic> &&
            decodedResponse['data']['data'] is List) {
          var dataList = decodedResponse['data']['data'] as List;
          if (dataList.isNotEmpty) {
            sectionkpi = dataList[0]['id'];
          } else {
            throw FailureException('Data list is empty');
          }
        } else {
          throw FailureException('Unexpected JSON structure');
        }

        if (sectionkpi == null) {
          throw FailureException('Extracted sectionkpi is null');
        }

        // Request untuk mengupdate goal setting
        final Uri url = Uri.parse(
            '$baseUrl/kpi/$companyid/employee/$nik/section/$sectionkpi/update');

        final response = await http.post(
          url,
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
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
              {"week": 5, "value": updateGoalSetting},
            ]
          }),
        );

        if (response.statusCode == 200) {
          final decodedResponse = json.decode(response.body);
          final modelListInfo = SandUpdateGoalSetting.fromJson(decodedResponse);

          return modelListInfo;
        } else {
          print('HTTP Error: ${response.statusCode}');
          throw FailureException('Response are not success');
        }
      } else {
        print('HTTP Error: ${responseSection.statusCode}');
        throw FailureException('Failed to load section data');
      }
    } on SocketException {
      throw FailureException('No internet connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException('Failed to load list data by formId $formId');
    }
  }
}
