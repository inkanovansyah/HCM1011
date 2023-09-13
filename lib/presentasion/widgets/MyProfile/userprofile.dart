import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  // const profile({super.key});
  final String label_1;
  final String label_2;
  final String label_3;
  final String label_4;

  profile({
    required this.label_1,
    required this.label_2,
    required this.label_3,
    required this.label_4,
  });

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Image.asset(
        'assets/images/Profile-1.png', // Ganti dengan path gambar Anda
        height: 300.0, // Tinggi gambar dalam piksel
      ),
    );
  }
}
