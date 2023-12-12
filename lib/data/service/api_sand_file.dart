import 'dart:convert';

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/detailinfo.dart';

class DetailInfo {
  final String baseUrl = "https://172.16.0.21";

  Future<ModelDetailtInfo> fetchDataDetail(String userfile) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var nama = prefs.getString('fullname');
      var file = '{"original":{"width":"300","height":"300"},}';
      final Uri url = Uri.parse('$baseUrl/hcm-imageserver/public/api');
      print('$url');
      final Map<String, String> data = {
        'userfile': userfile,
        'domain': 'FOTO-HCM',
        'folder': 'atandance-1011',
        'sizes': file,
        'name': '$nama',
      };

      final jsonEncodedData = json.encode(data);
      // Ganti ini dengan data yang ingin Anda kirimkan dalam permintaan POST
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncodedData,
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
      throw FailureException('faild to load list date by date $userfile');
    }
  }
}
