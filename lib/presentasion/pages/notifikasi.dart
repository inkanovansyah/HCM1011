import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:hcm1011/presentasion/widgets/body/body_notifikasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PayRoll extends StatefulWidget {
  const PayRoll({
    Key? key,
  }) : super(key: key);

  @override
  State<PayRoll> createState() => _payrollState();
}

class _payrollState extends State<PayRoll> {
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void showSessionTimeoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.info_outline,
                size: 50,
                color: Colors.grey,
              ),
              SizedBox(height: 16.0),
              Text(
                "Session Timeout!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "You have been logged out due to inactivity.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context)
                      .pushReplacementNamed('/login'); // Navigate to login
                },
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    if (token.isNotEmpty) {
      // If the token exists, check if it is expired
      bool isExpired = JwtDecoder.isExpired(token);

      if (isExpired) {
        // Token is expired, show session timeout dialog and redirect to login
        showSessionTimeoutDialog(context);
      } else {
        // Token is valid, proceed as normal
        // You can also check if you need to refresh the token here
      }
    } else {
      // Token does not exist, redirect to login
      showSessionTimeoutDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Notification',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false, // Menghilangkan tombol back
      ),
      backgroundColor: Color(0xffEEF2FD),
      body: notification(),
    );
  }
}
