import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/infolist.dart';
import 'package:intl/intl.dart';

final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat('yyyy-MM-dd');
String formatted = formatter.format(now);

class ListInfo {
  final String baseUrl = "https://api.1011.co.id";

  Future<ModelList> fetchListInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var company_id = prefs.getString('company_id');
      var level_id = prefs.getString('level_id');

      final Uri url = Uri.parse(
          '$baseUrl/office/$company_id/info/$level_id/2024-02-12/list-data-by-date');

      // Ganti ini dengan data yang ingin Anda kirimkan dalam permintaan POST
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token', // Tambahkan token ke header
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            "start": 0,
            "length": 5,
          },
        ),
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelListInfo = ModelList.fromJson(decodedResponse);

        return modelListInfo;
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
