import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/body/date.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _ClockState();
}

class _ClockState extends State<Detail> {
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
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 290,
            width: 156,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      width: 5.0, // Lebar garis tipis
                      color: Colors.blue, // Warna garis tipis
                    ),
                    SizedBox(width: 10), // Jarak antara garis biru dan teks
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12), // Jarak antara dua teks
                        Text(
                          'Wed, Agus 13, 2023',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 10, // Sesuaikan dengan posisi vertikal yang diinginkan
                  right:
                      10, // Sesuaikan dengan posisi horizontal yang diinginkan
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.green, // Warna latar belakang badge (hijau)
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'On Time',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white, // Warna teks badge (putih)
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 40), // Jarak antara garis dan waktu "Clock In"
                    Padding(
                      padding: EdgeInsets.only(left: 15), // Jarak ke kanan
                      child: Text(
                        'Clock In: 08:00 AM', // Ganti dengan waktu sesuai kebutuhan Anda
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold, // Make text bold
                        ),
                      ),
                    ),
                    SizedBox(
                        height:
                            10), // Jarak antara waktu "Clock In" dan "Clock Out"
                    Padding(
                      padding: EdgeInsets.only(left: 15), // Jarak ke kanan
                      child: Text(
                        'Clock Out: 05:00 PM', // Ganti dengan waktu sesuai kebutuhan Anda
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold, // Make text bold
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
    );
  }
}
