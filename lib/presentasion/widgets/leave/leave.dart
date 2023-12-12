import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class leaveW extends StatefulWidget {
  // const profile({super.key});

  @override
  State<leaveW> createState() => _leaveState();
}

class _leaveState extends State<leaveW> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      right: 10,
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0, // Adjust as needed
        height: 130, // Adjust as needed
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1BEFC7),
                  Color(0xFFF993E5),
                  Color(0xFFFFF1CA),
                  Color(0xFF62F4F4),
                ], // Replace with your desired colors
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(3.0),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 120.0,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Image.asset(
                            'assets/images/petir.png',
                            fit: BoxFit.cover,
                            width:
                                54, // Sesuaikan lebar gambar sesuai kebutuhan
                            height:
                                80, // Sesuaikan tinggi gambar sesuai kebutuhan
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Days',
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: 6), // Memberikan jarak antara teks
                              Row(
                                children: [
                                  Text(
                                    'Remaining Leaves | ', // Teks yang ditambahkan di bawah '10 Days'
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    ' 2 Days Used', // Teks yang ditambahkan di bawah '10 Days'
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 14.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
