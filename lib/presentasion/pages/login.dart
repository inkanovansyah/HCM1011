import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/body/login.dart';

class Login extends StatefulWidget {
  static String route = "/login";
  // const name({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hapus properti ini
        leading: null, // Hapus properti ini
        elevation: 0.0,
        backgroundColor: darkdarkBlueColor,
        toolbarHeight: 10.0,
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/images/Login.png',
            height: 124,
            width: 300,
          ),
          BodyLogin(),
        ],
      ),
    );
  }
}
