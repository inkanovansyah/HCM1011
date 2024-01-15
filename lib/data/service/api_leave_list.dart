import 'dart:convert';

import 'dart:io';

// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/leave.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final prefs = await SharedPreferences.getInstance();
//   String? token = prefs.getString('token');
//   // String? email = prefs.getString('email');
//   String? fullname = prefs.getString('fullname');

//   // print('email : $email');
//   print('fullname : $fullname');

//   if (token != null && fullname != null) {
//     print('data berhasil ambil');

//     // Use the AppUrlData class to fetch data

//     final resultdata = ListLeave();
//     final result = await resultdata.fatchDataLeave();
//     print('fetch data: ${result}');
//     return null;
//   } else {
//     print('Failed to fetch data.');
//   }
// }

class ListLeave {
  final String baseUri = "https://api.1011.co.id";

  Future<ModelLeave> fatchDataLeave() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');
      var employee_id = prefs.getString('employee_id');
      int currentYear = DateTime.now().year;

      final Uri url = Uri.parse(
          '$baseUri/activities/request/$company_id/employee/leave-request');

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token', // Tambahkan token ke header
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "start": 0,
          "length": 20,
          "search": {
            "employee_leaves.employee_id": '$employee_id',
            "(YEAR(employee_leaves.date_start))": "$currentYear"
          }
        }),
      );

      if (response.statusCode == 200) {
        // final decodedResponse = json.decode(response.body);
        // final modelListInfo = ModelLeave.fromJson(decodedResponse);
        // final modelListInfoString = json.encode(modelListInfo);
        // print('ModelListInfo as String: ${modelListInfoString}');
        return ModelLeave.fromJson(json.decode(response.body));
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response are not success');
      }
    } on SocketException {
      throw FailureException('no internet Connection');
    } catch (e) {
      throw FailureException('faild to load list ');
    }
  }
}
