import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _nameState();
}

class _nameState extends State<screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Ambil Gambar',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous page
          },
        ), // Menghilangkan tombol back
      ),
      body: Container(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 0.0), // Sesuaikan dengan posisi yang diinginkan
            child: Image.asset(
              'assets/banner/bgComing.png', // Ganti dengan path gambar Anda
              width: 300, // Lebar gambar
              height: 300, // Tinggi gambar
            ),
          ),
        ),
      ),
    );
  }
}
