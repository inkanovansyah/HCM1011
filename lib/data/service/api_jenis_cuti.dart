import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/type_cuti.dart';

class TypeLeaveListapi {
  final String baseUrl = "https://api.1011.co.id";

  Future<Typeofleave> fetchTypeLeave() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var company_id = prefs.getString('company_id');
      var token = prefs.getString('token');
      final Uri url = Uri.parse('$baseUrl/master/$company_id/leave/list');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            "start": 0,
            "length": 10,
          },
        ),
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelLeave = Typeofleave.fromJson(decodedResponse);
        return modelLeave;
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response are not success');
      }
    } on SocketException {
      throw FailureException('no internet Connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException('faild to load');
    }
  }
}
