import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/liststory.dart';
import 'package:hcm1011/data/model/failure_exception.dart';

class ListStory {
  final String baseUrl = "http://172.16.0.67/rest-api/public/list-upload";
  Future<ListStoryn> fatchListStory() async {
    try {
      final Uri url = Uri.parse('$baseUrl');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "start": 0,
          "lenght": 5,
        }),
      );
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelListInfo = ListStoryn.fromJson(decodedResponse);

        return modelListInfo;

        // return ModelListInfo.fromJson(decodedResponse);
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
