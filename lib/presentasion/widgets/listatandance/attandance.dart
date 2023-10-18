import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class infoAttandance extends StatefulWidget {
  // const listAttandance({super.key});
  final String label_1;
  final String label_2;
  final String label_3;
  final String label_4;

  infoAttandance({
    required this.label_1,
    required this.label_2,
    required this.label_3,
    required this.label_4,
  });
  @override
  State<infoAttandance> createState() => _attandanceState();
}

class _attandanceState extends State<infoAttandance> {
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
            height: 150,
            width: 156,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(height: 25),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 75.0,
                              height: 75.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: bluesskyColor,
                              ),
                              child: Center(
                                child: Text(
                                  '50%',
                                  style: TextStyle(
                                    color: darkdarkBlueColor,
                                    fontSize: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ), // Jarak antara linkaran dan teks
                            Text(
                              'Present',
                              style: TextStyle(
                                color: darkdarkBlueColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 75.0,
                              height: 75.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: bluesskyColor,
                              ),
                              child: Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    color: darkdarkBlueColor,
                                    fontSize: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: 8.0), // Jarak antara linkaran dan teks
                            Text(
                              'Leave',
                              style: TextStyle(
                                color: darkdarkBlueColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 75.0,
                              height: 75.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: bluesskyColor,
                              ),
                              child: Center(
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                    color: darkdarkBlueColor,
                                    fontSize: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: 8.0), // Jarak antara linkaran dan teks
                            Text(
                              'Sick',
                              style: TextStyle(
                                color: darkdarkBlueColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 75.0,
                              height: 75.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: bluesskyColor,
                              ),
                              child: Center(
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                    color: darkdarkBlueColor,
                                    fontSize: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: 8.0), // Jarak antara linkaran dan teks
                            Text(
                              'Permission',
                              style: TextStyle(
                                color: darkdarkBlueColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
