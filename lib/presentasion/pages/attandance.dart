import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/listatandance/attandance.dart';
import 'package:hcm1011/presentasion/widgets/listatandance/clock.dart';
import 'package:hcm1011/presentasion/widgets/listatandance/attandance-detil.dart';

class listAtandance extends StatefulWidget {
  const listAtandance({super.key});

  @override
  State<listAtandance> createState() => _AttendanceState();
}

class _AttendanceState extends State<listAtandance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor, // Mengatur warna biru gelap
        centerTitle: true,
        title: Text('My Attandence'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          infoAttandance(
            label_1: 'Chack In',
            label_2: '09:00',
            label_3: 'Chack Out',
            label_4: '18:00',
          ),
          SizedBox(
            height: 10,
          ),
          Clock(),
          SizedBox(
            height: 10,
          ),
          Detail(),
        ],
      ),
    );
  }
}
