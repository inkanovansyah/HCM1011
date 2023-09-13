import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class dataProfile extends StatefulWidget {
  // const dataProfile({super.key});
  final String name;
  final String jabatan;
  final String nik;
  final String temlahir;
  final String tanglahir;
  final String email;
  final String hp;

  dataProfile({
    required this.name,
    required this.jabatan,
    required this.nik,
    required this.temlahir,
    required this.tanglahir,
    required this.email,
    required this.hp,
  });

  @override
  State<dataProfile> createState() => _profileState();
}

class _profileState extends State<dataProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Teks akan rata kiri
        children: [
          Text(
            widget.name,
            style: poppinsBoldDark.copyWith(fontSize: 20),
          ),
          Text(
            widget.jabatan,
            style: poppinsMediumDark.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
