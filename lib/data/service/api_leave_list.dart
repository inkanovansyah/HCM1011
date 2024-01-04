import 'dart:convert';

import 'dart:io';

// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/leave.dart';

class ListLeave {
  final String baseUri = "https://api.1011.co.id";

  Future<ModelLeave> fatchDataLeave() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var employee_id = prefs.getString('employee_id');
      final Uri url = Uri.parse(
          '$baseUri/activities/request/$employee_id/employee/leave-request');

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token', // Tambahkan token ke header
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          {
            "start": 0,
            "length": 20,
            "search": {
              "employee_leaves.employee_id": "10",
              "(YEAR(employee_leaves.date_start))": "2023"
            }
          }
        }),
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelListInfo = ModelLeave.fromJson(decodedResponse);

        // final modelListInfoString = json.encode(modelListInfo);

        // print('ModelListInfo as String: ${modelListInfoString}');

        return modelListInfo;

        // return ModelListInfo.fromJson(decodedResponse);
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response are not success');
      }
    } on SocketException {
      throw FailureException('no internet Connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException('faild to load list date by date');
    }
  }
}
