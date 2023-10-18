import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/body/InfoUpdate.dart';

class PagesUpdate extends StatefulWidget {
  const PagesUpdate({super.key});

  @override
  State<PagesUpdate> createState() => _pageUpdate();
}

class _pageUpdate extends State<PagesUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 251, 255),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Info & Update',
          style: TextStyle(
            color: Colors.black, // Mengatur warna teks menjadi hitam
          ),
        ),
        iconTheme: IconThemeData(
          color:
              Colors.black, // Mengatur warna ikon (tombol "back") menjadi putih
        ),
      ),
      backgroundColor: Color.fromARGB(255, 245, 251, 255),
      body: const InfoUpdate(),
    );
  }
}
