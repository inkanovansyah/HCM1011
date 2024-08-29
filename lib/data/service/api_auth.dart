import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/auth_login.dart';

class Auth {
  final String baseUrl = "https://api.1011.co.id";

  Future<void> authLoginApi(String email, String password) async {
    final url = Uri.parse('$baseUrl/login/auth');
    try {
      final response = await http.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Authlogin authlogin =
            Authlogin.fromJson(json.decode(response.body));
        if (authlogin.data != null && authlogin.data!.token != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', authlogin.data!.token!);
          await prefs.setString('email', authlogin.data!.detail?.email ?? '');
          await prefs.setString(
              'fullname', authlogin.data!.detail?.fullname ?? '');
        } else {
          throw FailureException('Login failed. Token is missing.');
        }
      } else {
        throw FailureException(
            'Login failed with status code ${response.statusCode}.');
      }
    } catch (e) {
      throw FailureException('An unknown error occurred: $e');
    }
  }
}
