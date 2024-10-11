import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';

import 'package:hcm1011/data/model/addTrining.dart';

import 'package:shared_preferences/shared_preferences.dart';

class addTrining {
  final String baseUri = 'https://api.1011.co.id';

  Future<AddTrining> fatchDataApplyTraining(String idschedule) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');
      var employee_id = prefs.getString('employee_id');

      final Uri url =
          Uri.parse('$baseUri/training/$company_id/participants/add-data');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token', // Tambahkan token ke header
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "training_schedule_id": '$idschedule',
          "employee_id": employee_id
        }),
      );
      print('Response body: ${response.body}'); // Cetak response.body
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelApplytraining = AddTrining.fromJson(decodedResponse);
        return modelApplytraining;
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response are not success');
      }
    } on SocketException {
      throw FailureException('no internet Connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException('You are already registered');
    }
  }
}
