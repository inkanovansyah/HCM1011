import 'dart:io';

// import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/data/model/failure_exception.dart';

class Profile {
  Future<Map<String, String>> fetchDataProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var fullname = prefs.getString('fullname') ?? '';
      var positionname = prefs.getString('position_name') ?? '';
      var email = prefs.getString('email') ?? '';
      var nik = prefs.getString('nik') ?? '';
      var dob = prefs.getString('dob') ?? '';
      var pob = prefs.getString('pob') ?? '';
      var image = prefs.getString('image') ?? '';

      return {
        'email': email,
        'fullname': fullname,
        'position_name': positionname,
        'nik': nik,
        'dob': dob,
        'pob': pob,
        'image': image,
      };
    } on SocketException {
      throw FailureException('Tidak ada koneksi internet');
    } catch (e) {
      print('Error: $e');
      throw FailureException('Gagal memuat data');
    }
  }
}
