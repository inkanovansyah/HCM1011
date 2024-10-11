import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';

import 'package:hcm1011/data/model/faceRacognition.dart';

class DetailInfo {
  final String baseUrl = "https://fileshare.1011.co.id/";

  Future<String> fetchDataDetail(File userfile) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var nama = prefs.getString('fullname');
      final Uri url = Uri.parse('$baseUrl/upload-image.php');
      // print('$url');

      var request = http.MultipartRequest('POST', Uri.parse('$url'));

      request.fields.addAll({
        'domain': 'hcm',
        'folder': 'hcm',
        'sizes': '{"original":{"width":"1080","height":"1080"}}',
        'name': 'inka',
        'location': '{"lat" : 20.00, "long": 344.00}'
      });
      var file = http.MultipartFile(
        'image',
        userfile.readAsBytes().asStream(),
        userfile.lengthSync(),
        filename: '$nama.png',
      );

      request.files.add(file);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = await response.stream.bytesToString();
        return responseData;
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response is not successful');
      }
    } on SocketException {
      throw FailureException('No internet connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException('Failed to load list date by date');
    }
  }
}
