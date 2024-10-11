import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/listTransaksiBooking.dart';

class TransaksiRoomType {
  final String baseUri = "http://172.16.0.206";

  Future<ListtransaksiBooking> fatchDataTransaksiBooking() async {
    try {
      final Uri url = Uri.parse('$baseUri/rest-api/public/list-book/carlist');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            "start": 0,
            "lenght": 3,
          },
        ),
      );

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        final modelTransaksiBooking =
            ListtransaksiBooking.fromJson(decodedResponse);
        return modelTransaksiBooking;
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
