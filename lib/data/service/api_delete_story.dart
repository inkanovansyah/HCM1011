import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/deleteStory.dart';

class DeleteStoryList {
  final String baseUrl = 'http://172.16.0.206';

  Future<DeleteStoryModel> fatchDeleteStory(String id) async {
    try {
      final Uri url =
          Uri.parse('$baseUrl/rest-api/public/list-book/update-story/$id');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {"is_delete": 1},
        ),
      );

      print(response.body);
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        return DeleteStoryModel.fromJson(decodedResponse);
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response are not success');
      }
    } on SocketException {
      throw FailureException('no internet Connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException('failed to load');
    }
  }
}
