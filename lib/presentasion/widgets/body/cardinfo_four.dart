import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:intl/intl.dart'; // Pastikan Anda menambahkan package intl di pubspec.yaml

class CardInfoFour extends StatefulWidget {
  const CardInfoFour({super.key});

  @override
  State<CardInfoFour> createState() => _CardInfoFourState();
}

class _CardInfoFourState extends State<CardInfoFour> {
  @override
  Widget build(BuildContext context) {
    // Ambil tanggal sekarang
    final DateTime now = DateTime.now();

    // Format tanggal menjadi nama bulan dan tahun
    final String formattedMonthYear = DateFormat('MMMM yyyy').format(now);

    // Ambil tanggal
    final String day = now.day.toString();
    return Transform.translate(
      offset: Offset(0, 6), // Geser ke atas sebanyak 6 piksel
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.13,
        width: MediaQuery.of(context).size.width * 0.47, // Sesuaikan lebar card
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.4), // Reduced padding
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 0.0,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/images/Asset_4.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '$formattedMonthYear',
                            style: TextStyle(
                              fontSize: 22,
                              color: darkdarkBlueColor,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '$day', // Ganti dengan nilai tetap
                            style: TextStyle(
                              fontSize: 32,
                              color: darkdarkBlueColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
