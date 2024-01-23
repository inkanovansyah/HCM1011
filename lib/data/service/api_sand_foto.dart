import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';

class DetailInfo {
  final String baseUrl = "https://storage.1011.co.id";

  Future<String> fetchDataDetail(File userfile) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var nama = prefs.getString('fullname');
      // final Uri url = Uri.parse('$baseUrl/api/store');
      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/api/store'));

      request.fields.addAll({
        '_method': 'PUT',
        'key': '123456',
        'domain': '1011.co.id',
        'folder': '$nama-story-1011',
        'size': '{"large":{"width":"1080","height":"1080"}}',
        'title': '1011.co.id',
      });
      var file = http.MultipartFile(
        'image',
        userfile
            .readAsBytes()
            .asStream(), // Ambil data gambar sebagai byte stream
        userfile.lengthSync(), // Berikan length dari file
        filename: '$nama.jpg', // Gunakan ID perusahaan sebagai nama file
      );
      request.files.add(file);
      print('$request');
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
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
      throw FailureException('Failed to load list date');
    }
  }
}
