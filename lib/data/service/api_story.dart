import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';

class InsertStory {
  final String baseUrl = "http://172.16.0.104/rest-api/public/list-upload/save";
  Future<String> fetchStoryApi(String source) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var nama = prefs.getString('fullname');
      // print('nama nih : ${nama}');
      final Uri url = Uri.parse('$baseUrl');
      String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final response = await http.post(
        url,
        headers: {
          // Tambahkan token ke header
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "name_file": '$nama',
          "source": source,
          "create_by": '$nama',
          "create_at": '$formattedDate'
        }),
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        print('Response from API: $decodedResponse');
        return "Success: Story uploaded successfully. $decodedResponse";
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
