import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/submit_goal_setting.dart';

class SubmitGs {
  final String baseUrl = "https://api.1011.co.id";

  Future<SubmitGoalSetting> fachSubmitdataGs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var company_id = prefs.getString('company_id');
      var nik = prefs.getString('nik');
      var token = prefs.getString('token');

      // First API call to get the list
      final Uri listUrl =
          Uri.parse('$baseUrl/kpi/$company_id/employee/$nik/list');

      final listResponse = await http.post(
        listUrl,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "is_active": 1,
        }),
      );
      print('listUrl: $listUrl');

      if (listResponse.statusCode == 200) {
        final decodedListResponse = json.decode(listResponse.body);
        // print('decodedListResponse: $decodedListResponse');

        var sectionId;
        var id;

        // Check if the response contains 'data' and 'data' is a list
        if (decodedListResponse.containsKey('data') &&
            decodedListResponse['data'] is Map<String, dynamic> &&
            decodedListResponse['data']['data'] is List) {
          var dataList = decodedListResponse['data']['data'] as List;
          if (dataList.isNotEmpty) {
            sectionId = dataList[0]['section_id'];
          } else {
            throw FailureException('Data list is empty');
          }
        } else {
          throw FailureException('Unexpected JSON structure');
        }

        // Ensure sectionId and id are not null
        if (sectionId == null || id == null) {
          throw FailureException('Extracted sectionId or id is null');
        }

        // Second API call using the extracted value
        final Uri detailUrl = Uri.parse(
            '$baseUrl/kpi/$company_id/employee/$nik/section/$sectionId/self-submit-goals-setting');
        print('detailUrl: $detailUrl');
        final detailResponse = await http.post(
          detailUrl,
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        );

        if (detailResponse.statusCode == 200) {
          final decodedDetailResponse = json.decode(detailResponse.body);

          final modelListInfo =
              SubmitGoalSetting.fromJson(decodedDetailResponse);

          return modelListInfo;
        } else {
          print('HTTP Error: ${detailResponse.statusCode}');
          throw FailureException('Second response was not successful');
        }
      } else {
        print('HTTP Error: ${listResponse.statusCode}');
        throw FailureException('First response was not successful');
      }
    } on SocketException {
      throw FailureException('No internet connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException('Failed to load');
    }
  }
}
