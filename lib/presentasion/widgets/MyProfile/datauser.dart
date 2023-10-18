import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class dataProfile extends StatefulWidget {
  // const dataProfile({super.key});
  final String name;
  final String jabatan;
  final String nik;
  final String temlahir;
  final String tanglahir;
  final String email;
  final String hp;

  dataProfile({
    required this.name,
    required this.jabatan,
    required this.nik,
    required this.temlahir,
    required this.tanglahir,
    required this.email,
    required this.hp,
  });

  @override
  State<dataProfile> createState() => _profileState();
}

class _profileState extends State<dataProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10), // Add 20 pixels margin on both sides
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Bentuk border card
        ), // Card elevation for a shadow effect
        child: Padding(
          padding: EdgeInsets.all(18), // Padding inside the card
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align content to the left
            children: [
              Text(
                'nik:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.nik,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10), // Add spacing between sections
              Text(
                'Tempat lahir:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.temlahir,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'tanggal lahir:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.tanglahir,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'email:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.email,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'hp:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.hp,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
