import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/replacment.dart';

class EmployeeReplacementapi {
  final String baseUrl = "https://api.1011.co.id";
  Future<Replacement> fatchDataReplacement() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');

      final Uri url = Uri.parse('$baseUrl/company/$company_id/employee/list');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {"start": 0, "length": 300},
        ),
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelReplacement = Replacement.fromJson(decodedResponse);
        return modelReplacement;
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
