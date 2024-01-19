import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/payroll.dart';

class DetailPayroll {
  final String baseUrl = "https://api.1011.co.id";

  Future<ModelDetailpayroll> fatchDetailPayroll() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');

      final Uri url =
          Uri.parse('$baseUrl/payroll/$company_id/salary-this-month');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token', // Tambahkan token ke header
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"employee_id": 41, "year": "2023", "month": "11"}),
      );
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelListInfo = ModelDetailpayroll.fromJson(decodedResponse);

        return modelListInfo;
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response are not success');
      }
    } on SocketException {
      throw FailureException('no internet Connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException('faild to load list payroll data');
    }
  }
}
