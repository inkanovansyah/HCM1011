import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/pages/face_recognition.dart';
import 'package:hcm1011/presentasion/pages/attandance.dart';
import 'package:hcm1011/presentasion/pages/leave.dart';

class bodyDashboard extends StatefulWidget {
  @override
  State<bodyDashboard> createState() => _BodyDashboardState();
}

class _BodyDashboardState extends State<bodyDashboard> {
  final TextEditingController menuController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: MediaQuery.of(context).size.height *
                  0.33, // Menggunakan 1/4 tinggi layar
              width: MediaQuery.of(context).size.width,
              color: darkdarkBlueColor, // Warna latar belakang biru
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  ClipOval(
                    child: Container(
                      width:
                          60.0, // Ubah sesuai dengan ukuran yang Anda inginkan
                      height:
                          60.0, // Ubah sesuai dengan ukuran yang Anda inginkan
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
                  SizedBox(
                    width: 20.0, // Jarak antara gambar dan teks
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Inka Novansyah',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Tukang Gambar',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0, top: 70, right: 12.0),
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              child: SizedBox(
                width: 400.0,
                height: 200.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Menu 1
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => listAtandance(),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/Attandance.png',
                                  width: 50.0,
                                  height: 50.0,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Attendance',
                                  style: TextStyle(fontSize: 14.0),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Menu 2
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => face_recognition(),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/Salary.png',
                                  width: 50.0,
                                  height: 50.0,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Salary',
                                  style: TextStyle(fontSize: 14.0),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Menu 3
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => leave(),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/Leave.png',
                                  width: 50.0,
                                  height: 50.0,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Leave',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Menu 4
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/Training.png',
                                width: 50.0,
                                height: 50.0,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Training',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Menu 1
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => listAtandance(),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/Attandance.png',
                                  width: 50.0,
                                  height: 50.0,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Coming son',
                                  style: TextStyle(fontSize: 14.0),
                                  textAlign: TextAlign.center,
                                ),
                              ],
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
        ],
      ),
    );
  }
}
