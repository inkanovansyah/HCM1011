import 'dart:io';

import 'package:geolocator/geolocator.dart';
// import 'package:hcm1011/data/model/crd_face.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

import 'package:http/http.dart' as http;

class Atandance {
  Future<String> uploadImage(File imageFile) async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        throw FailureException('Location permission denied');
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double latitude = position.latitude;
      double longitude = position.longitude;
      var request = http.MultipartRequest('POST',
          Uri.parse('https://face-recognition.1011.co.id/upload-image.php'));
      final prefs = await SharedPreferences.getInstance();
      var company_id = prefs.getString('fullname');

      request.fields.addAll({
        'domain': 'hcm',
        'folder': 'hcm',
        'sizes': '{"original":{"width":"500","height":"500"}}',
        'name': '$company_id',
        'location': '{"lat" : "$latitude", "long": "$longitude"}'
      });
      print(
          'Latitude: $latitude, Longitude: $longitude'); // Print latitude and longitude
      // Replace this path with the actual path to your image
      var file = http.MultipartFile(
        'image',
        imageFile
            .readAsBytes()
            .asStream(), // Ambil data gambar sebagai byte stream
        imageFile.lengthSync(), // Berikan length dari file
        filename: '$company_id.jpg', // Gunakan ID perusahaan sebagai nama file
      );

      request.files.add(file);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        // final responseString = utf8.decode(responseData);
        // final imageUrl = json.decode(responseString)[
        //     'image']; // Ganti 'imageUrl' dengan key yang sesuai di responsenya
        return responseData;
      } else {
        print('HTTP Error: ${response.statusCode}');
        throw FailureException('Response is not successful');
      }
    } on SocketException {
      throw FailureException('No internet connection');
    } catch (e) {
      print('Error: $e');
      throw FailureException('Failed to Request');
    }
  }
}
// Fungsi untuk mendapatkan lokasi saat ini
