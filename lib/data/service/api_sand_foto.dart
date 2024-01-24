import 'dart:io';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';

class DetailInfo {
  final String baseUrl = "https://storage.1011.co.id";
  String generateRandomString(int length) {
    const String chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    math.Random random = math.Random();
    return String.fromCharCodes(List.generate(
        length, (index) => chars.codeUnitAt(random.nextInt(chars.length))));
  }

  Future<String> fetchDataDetail(File userfile) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var nama = prefs.getString('fullname');
      var randomString = generateRandomString(8); // Adjust the length as needed
      // final Uri url = Uri.parse('$baseUrl/api/store');
      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/api/store'));

      request.fields.addAll({
        '_method': 'PUT',
        'key': '123456',
        'domain': '1011.co.id',
        'folder': 'nama-story-1011',
        'size': '{"large":{"width":"1080","height":"1080"}}',
        'title': '1011.co.id',
      });
      var file = http.MultipartFile(
        'image',
        userfile
            .readAsBytes()
            .asStream(), // Ambil data gambar sebagai byte stream
        userfile.lengthSync(), // Berikan length dari file
        filename:
            '$nama-$randomString.png', // Gunakan ID perusahaan sebagai nama file
      );
      request.files.add(file);
      print('$request');
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
      throw FailureException('Failed to load list date');
    }
  }
}
