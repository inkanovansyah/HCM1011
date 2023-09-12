import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/widgets/face_recognition/face_recognition.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class face_recognition extends StatefulWidget {
  const face_recognition({super.key});

  @override
  State<face_recognition> createState() => _face_recognitionState();
}

class _face_recognitionState extends State<face_recognition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor, // Mengatur warna biru gelap
        centerTitle: true,
        title: Text('Attendance'),
      ),
      body: const CameraPage(),
    );
  }
}
