import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class listAttandance extends StatefulWidget {
  // const listAttandance({super.key});
  final String label_1;
  final String label_2;
  final String label_3;
  final String label_4;

  listAttandance({
    required this.label_1,
    required this.label_2,
    required this.label_3,
    required this.label_4,
  });
  @override
  State<listAttandance> createState() => _attandanceState();
}

class _attandanceState extends State<listAttandance> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 80,
            width: 156,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: darkdarkBlueColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    ClipOval(
                      child: Container(
                        width:
                            45.0, // Ubah sesuai dengan ukuran yang Anda inginkan
                        height:
                            45.0, // Ubah sesuai dengan ukuran yang Anda inginkan
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue
                                  .withOpacity(0.5), // Warna bayangan biru
                              spreadRadius: 5, // Seberapa besar bayangan
                              blurRadius: 10, // Seberapa buram bayangan
                              offset: Offset(0, 0), // Posisi bayangan
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              1.0), // Tambahkan jarak di sini
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/Profile.png',
                              fit: BoxFit
                                  .cover, // Menyesuaikan gambar ke dalam lingkaran
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.label_1,
                            style: poppinsMediumDark.copyWith(
                              fontSize: 16,
                              color: darkblueskyColor,
                            ),
                            textAlign: TextAlign.left,
                            // Set penjajaran teks ke kiri
                          ),
                          Text(
                            widget.label_2,
                            style: poppinsMediumDark.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: darkblueskyColor,
                            ),
                            textAlign:
                                TextAlign.left, // Set penjajaran teks ke kiri
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.label_3,
                            style: poppinsMediumDark.copyWith(
                              fontSize: 16,
                              color: darkblueskyColor,
                            ),
                            textAlign: TextAlign.left,
                            // Set penjajaran teks ke kiri
                          ),
                          Text(
                            widget.label_4,
                            style: poppinsMediumDark.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: darkblueskyColor,
                            ),
                            textAlign:
                                TextAlign.left, // Set penjajaran teks ke kiri
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
