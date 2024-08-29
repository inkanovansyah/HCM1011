import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/self_submit_gs.dart';

class SalfSubmitApprovalGs {
  final String baseUrl = "https://api.1011.co.id";

  Future<SubmitSelfGoalSetting> fachdSalfSubmitApproval() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var company_id = prefs.getString('company_id');
      var token = prefs.getString('token');
      var nik = prefs.getString('nik');
      final Uri url = Uri.parse('$baseUrl/kpi/$company_id/employee/$nik/list');
      print('url: $url');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "is_active": 1,
        }),
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        // print('decodedResponse: $decodedResponse');

        var sectionId;

        // Check if the response contains 'data' and 'data' is a list
        if (decodedResponse.containsKey('data') &&
            decodedResponse['data'] is Map<String, dynamic> &&
            decodedResponse['data']['data'] is List) {
          var dataList = decodedResponse['data']['data'] as List;
          if (dataList.isNotEmpty) {
            sectionId = dataList[0]['section_id'];
          } else {
            throw FailureException('Data list is empty');
          }
        } else {
          throw FailureException('Unexpected JSON structure');
        }

        if (sectionId == null) {
          throw FailureException('Extracted sectionId is null');
        }

        final Uri listUrl = Uri.parse(
            '$baseUrl/kpi/$company_id/employee/$nik/section/$sectionId/self-submit');
        final listResponse = await http.post(
          listUrl,
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        );

        if (listResponse.statusCode == 200) {
          final decodedListResponse = json.decode(listResponse.body);
          final modelSubmitAproval =
              SubmitSelfGoalSetting.fromJson(decodedListResponse);
          return modelSubmitAproval;
        } else {
          print('HTTP Error: ${listResponse.statusCode}');
          throw FailureException('Second response was not successful');
        }
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('No internet connection');
      }
    } on SocketException {
      throw FailureException('No internet connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException('Unexpected error occurred');
    }
  }
}
