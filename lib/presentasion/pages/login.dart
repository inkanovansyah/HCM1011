import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/body/login.dart';

class login extends StatefulWidget {
  // const name({super.key});

  @override
  State<login> createState() => _LoginState();
}

class _LoginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        toolbarHeight: 70.0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 77),
            Image.asset(
              'assets/images/logo.png', // Replace with the path to your image
              width: 60, // Adjust the width as needed
              height: 60, // Adjust the height as needed
            ),
            const SizedBox(
                width: 0), // Adjust the spacing between image and text
            const Text(
              'HCM 1011',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          BodyLogin(),
        ],
      ),
    );
  }
}
