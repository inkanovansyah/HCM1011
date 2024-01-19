import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkLogin {
  final String baseUrl = "https://api.1011.co.id/";

  Future<bool> loginApi(String email, String password) async {
    try {
      final Uri url = Uri.parse('$baseUrl/auth/login');
      // Membuat objek untuk data yang akan dikirim dalam format JSON
      final Map<String, String> data = {
        'email': email,
        'password': password,
      };

      // Mengkonversi objek data ke dalam format JSON
      final jsonEncodedData = json.encode(data);
      await Future.delayed(Duration(seconds: 6));

      final response = await http.post(
        url,
        headers: {
          'Content-Type':
              'application/json', // Atur header sesuai dengan format yang Anda kirimkan
        },
        body:
            jsonEncodedData, // Kirim data dalam format JSON yang telah dienkripsi
      );
      String truncateString(String? text, int maxLength) =>
          text != null && text.length > maxLength
              ? text.substring(0, maxLength - 3) + '...'
              : text ?? '';

      if (response.statusCode == 200) {
        // Jika login berhasil, simpan status login di SharedPreferences.
        final responseData = json.decode(response.body);
        final detail = responseData['data'];
        // print('$responseData');
        final Map<String, dynamic> dataToStore = {
          'token': detail['token'] as String?, // Ensure it's the correct key
          'position_name':
              truncateString(detail['detail']['position_name'] as String?, 12),
          'email': detail['detail']['email'] as String?,
          'employee_id': detail['detail']['employee_id'] as String?,
          'dob': detail['detail']['dob'] as String?,
          'pob': detail['detail']['pob'] as String?,
          'fullname':
              truncateString(detail['detail']['fullname'] as String?, 22),
          'company_id': detail['detail']['company_id'] as String?,
          'company_name': detail['detail']['company_name'] as String?,
          'level_id': detail['detail']['level_id']
              as String?, // Check if it's the correct key
          'nik': detail['detail']['nik'] as String?,
          'image': detail['detail']['image'] as String?,
        };
        final prefs = await SharedPreferences.getInstance();
        dataToStore.forEach((key, value) {
          if (value != null) {
            // print('$key: $value');
            prefs.setString(key, value);
          }
        });
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<void> chackLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', true);
  }
}

class Logout {
  Future<void> logout(String username) async {
    try {
      // Simulasi waktu logout selama 6 detik
      await Future.delayed(Duration(seconds: 6));
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      print('Error while logging out: $e');
    }
  }
}
