import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class Kpi extends StatefulWidget {
  const Kpi({super.key});

  @override
  State<Kpi> createState() => _nameKpi();
}

class _nameKpi extends State<Kpi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Key Performance Indikator',
          style: TextStyle(
            color: Colors.white, // Mengatur warna teks menjadi hitam
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous page
          },
        ),
      ),
      backgroundColor: Color(0xffEEF2FD),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ClipRRect(
                      child: Container(
                        height: MediaQuery.of(context).size.height *
                            0.30, // 15% of screen height
                        width: MediaQuery.of(context).size.width,
                        color:
                            darkdarkBlueColor, // Background color (darkdarkBlueColor)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.00,
              left: 20,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  width: 350,
                  height: 500,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'KPI Status',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10), // Jarak antara judul dan deskripsi
                      Text(
                        '75%', // Ganti dengan deskripsi sesuai kebutuhan
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10), // Jarak antara judul dan deskripsi
                      Text(
                        'week 3', // Ganti dengan deskripsi sesuai kebutuhan
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start, // Atur posisi ke kiri
                          children: [
                            Text(
                              'Instruction 1',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Form Penilaian Kinerja ini terdiri dari 1 bagian:\nBagian A: Individual Key Performance Indicators (KPI)',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Evaluasi yang dilakukan oleh Atasan harus\nobjektif danberdasarkan kinerja aktual\nserta perilaku kerja yang diamati. \nMendiskusikan hasil evauasi harus dilakukan\nuntuk mengetahui umpan balik atas pencapaian kinerja\ndengan Karyawan.',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Karyawan dan Atasan akan menandatangani\ndan memberikan komentar pada halaman 2\nuntuk menyatakan penyelesaian dari penilaian kinerja.',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
