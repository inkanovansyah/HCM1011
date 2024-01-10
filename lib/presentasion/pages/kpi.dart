import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/widgets/KPI/detail_kpi.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class Kpi extends StatefulWidget {
  const Kpi({Key? key}) : super(key: key);

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
      body: KpiDetail(),
    );
  }
}
