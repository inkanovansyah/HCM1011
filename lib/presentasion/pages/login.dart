import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/body/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static String route = "/login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _canNavigateBack = true;

  @override
  void initState() {
    super.initState();
    _checkTokens();
  }

  Future<void> _checkTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? emailToken = prefs.getString('token');
    String? email = prefs.getString('email');

    if (emailToken == null || email == null) {
      setState(() {
        _canNavigateBack = false;
      });
    }
  }

  Future<bool> _onWillPop() async {
    return _canNavigateBack;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: darkdarkBlueColor,
          toolbarHeight: 10.0,
        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/images/Login.png',
            ),
            BodyLogin(),
          ],
        ),
      ),
    );
  }
}
