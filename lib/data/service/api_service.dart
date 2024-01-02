import 'dart:convert';
import 'dart:io';

// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/info.dart';
import 'package:intl/intl.dart';

final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat('yyyy-MM-dd');
String formatted = formatter.format(now);

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

//     final resultdata = ListInfoBanner();
//     final result = await resultdata.fetchDatainfo();
//     print('fetch data: ${result}');
//     return null;
//   } else {
//     print('Failed to fetch data.');
//   }
// }

class ListInfoBanner {
  final String baseUrl = "https://api.1011.co.id";

  Future<ModelListInfo> fetchDatainfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');
      var level_id = prefs.getString('level_id');
      final Uri url = Uri.parse(
          '$baseUrl/office/$company_id/info/$level_id/2023-12-02/list-data-by-date');
      print('$url');
      // Ganti ini dengan data yang ingin Anda kirimkan dalam permintaan POST
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token', // Tambahkan token ke header
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "start": 0,
          "length": 3,
        }),
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelListInfo = ModelListInfo.fromJson(decodedResponse);

        // final modelListInfoString = json.encode(modelListInfo);

        // print('ModelListInfo as String Banner: ${modelListInfoString}');
        return ModelListInfo.fromJson(json.decode(response.body));
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
