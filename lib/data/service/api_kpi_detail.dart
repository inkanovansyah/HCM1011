import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/kpi_detail.dart';

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

//     final resultdata = KpiDetail();
//     final result = await resultdata.fatchDetailKpi();
//     print('fetch data: ${result}');
//     return null;
//   } else {
//     print('Failed to fetch data.');
//   }
// }

class KpiDetail {
  final String baseUri = "https://api.1011.co.id";

  Future<ModelDetailKpi> fatchDetailKpi() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');
      var nik = prefs.getString('nik');
      final Uri url = Uri.parse('$baseUri/kpi/$company_id/employee/$nik/list');

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token', // Tambahkan token ke header
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "start": 0,
          "length": 7,
        }),
      );
      // print(response.body);

      // print(url);
      if (response.statusCode == 200) {
        // final decodedResponse = json.decode(response.body);
        // final modelListInfo = ModelDetailKpi.fromJson(decodedResponse);
        // final modelListInfoString = json.encode(modelListInfo);
        // print('ModelListInfo as String: ${modelListInfoString}');
        return ModelDetailKpi.fromJson(json.decode(response.body));
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response are not success');
      }
    } on SocketException {
      throw FailureException('no internet Connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException('faild to load data');
    }
  }
}
