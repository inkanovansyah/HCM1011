import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/detailinfo.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final prefs = await SharedPreferences.getInstance();
//   String? token = prefs.getString('token');
//   // String? email = prefs.getString('email');
//   String? company_id = prefs.getString('company_id');

//   // print('email : $email');
//   print('fullname : $company_id');

//   if (token != null && company_id != null) {
//     print('data berhasil ambil');

//     // Use the AppUrlData class to fetch data

//     final resultdata = DetailInfo();
//     final result = await resultdata.fetchDataDetail("5");
//     print('fetch data: ${result}');
//     return null;
//   } else {
//     print('Failed to fetch data.');
//   }
// }

class DetailInfo {
  final String baseUrl = "https://api.1011.co.id";

  Future<ModelDetailtInfo> fetchDataDetail(String info_id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');

      final Uri url =
          Uri.parse('$baseUrl/office/$company_id/info/$info_id/detail');
      print('$url');
      // Ganti ini dengan data yang ingin Anda kirimkan dalam permintaan POST
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token', // Tambahkan token ke header
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // final modelListInfoString = json.encode(modelListInfo);

        return ModelDetailtInfo.fromJson(json.decode(response.body));

        // return ModelListInfo.fromJson(decodedResponse);
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response are not success');
      }
    } on SocketException {
      throw FailureException('no internet Connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException('faild to load list date by date $info_id');
    }
  }
}
