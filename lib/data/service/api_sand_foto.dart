import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/crd_face.dart';

class DetailInfo {
  final String baseUrl = "https://storage.1011.co.id";

  Future<SandPicture> fetchDataDetail(File userfile) async {
    try {
      // final prefs = await SharedPreferences.getInstance();
      // var nama = prefs.getString('fullname');
      final Uri url = Uri.parse('$baseUrl/api/store');
      // print('$url');

      var request = http.MultipartRequest('POST', url)
        ..fields['_method'] = 'PUT'
        ..fields['folder'] = 'Story-1011'
        ..fields['sizes'] = '{"large":{"width":"1080","height":"1080"}'
        ..fields['key'] = '1011.co.id'
        ..fields['domain'] = '1011.co.id'
        ..files.add(http.MultipartFile(
          'userfile',
          userfile.openRead(),
          await userfile.length(),
          filename: 'file.jpg',
        ));

      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        return SandPicture.fromJson(json.decode(response.body));
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
