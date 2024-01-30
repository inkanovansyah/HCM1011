import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/payroll.dart';

class DetailPayroll {
  final String baseUrl = "https://api.1011.co.id";

  Future<ModelDetailpayroll> fatchDetailPayroll(String month) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');
      var employee_id = prefs.getString('employee_id');
      String currentYear = DateFormat('y').format(DateTime.now());

      final Uri url =
          Uri.parse('$baseUrl/payroll/$company_id/salary-this-month');

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token', // Tambahkan token ke header
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            {"employee_id": employee_id, "year": currentYear, "month": month}),
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
      throw FailureException('Gaji belum di cetak');
    }
  }
}
