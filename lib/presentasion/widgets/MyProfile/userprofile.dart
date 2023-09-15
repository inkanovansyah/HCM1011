import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  // const profile({super.key});
  final String nama;
  final String jabatan;

  profile({
    required this.nama,
    required this.jabatan,
  });

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 15, // Elevasi card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Bentuk border card
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            // Gambar bulat
            Container(
              width: 80.0, // Lebar gambar bulat
              height: 80.0, // Tinggi gambar bulat
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit
                      .cover, // Untuk mengisi lebar penuh dan menyesuaikan tinggi
                  image: AssetImage(
                      'assets/images/Profile-1.png'), // Ganti dengan path gambar Anda
                ),
              ),
            ),
            SizedBox(width: 16.0), // Memberikan jarak antara gambar dan teks
            // Info teks
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.nama,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.jabatan,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
