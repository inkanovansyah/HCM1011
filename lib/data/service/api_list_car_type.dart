import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/typecar.dart';

class ListCarType {
  final String baseUri = "http://172.16.0.206";

  Future<TypeCarList> fatchDataListCarType() async {
    try {
      final Uri url = Uri.parse('$baseUri/rest-api/public/list-book/cartype');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "start": 0,
          "lenght": 10,
        }),
      );
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final modelListCarType = TypeCarList.fromJson(decodedResponse);
        return modelListCarType;
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response are not success');
      }
    } on SocketException {
      throw FailureException('no internet Connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException(
          'Booking range conflicts with an existing booking.');
    }
  }
}
