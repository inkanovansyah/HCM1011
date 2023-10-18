import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/info.dart';

class Network {
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

      final response = await http.post(
        url,
        headers: {
          'Content-Type':
              'application/json', // Atur header sesuai dengan format yang Anda kirimkan
        },
        body:
            jsonEncodedData, // Kirim data dalam format JSON yang telah dienkripsi
      );

      if (response.statusCode == 200) {
        // Jika login berhasil, simpan status login di SharedPreferences.
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);

        // Mengambil data department name dan full name dari respons API
        final responseData = json.decode(response.body);
        final positionname = responseData['data']['detail']['position_name'];
        final fullName = responseData['data']['detail']['fullname'];

        // print('Full Name: $fullName');
        // print('Department Name: $positionname');
        // Simpan data department name dan full name ke SharedPreferences
        prefs.setString('position_name', positionname);
        prefs.setString('fullname', fullName);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
