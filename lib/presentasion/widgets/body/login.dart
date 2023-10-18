import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/pages/Dashboard.dart';
import 'package:hcm1011/data/service/ApiLogin.dart';
import 'dart:convert';

class BodyLogin extends StatefulWidget {
  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final Network network = Network();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Sign in to your Account',
                  textAlign: TextAlign.start,
                  style: openSensBoldDark.copyWith(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Alamat Email',
                  textAlign: TextAlign.center,
                  style: openSensBoldDark.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: _buildTextField(
                  emailController,
                  Icons.account_circle,
                  'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Password',
                  textAlign: TextAlign.center,
                  style: openSensBoldDark.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: _buildTextField(
                  passwordController,
                  Icons.lock,
                  'Password',
                  obscureText: !isPasswordVisible,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;

                    // Panggil fungsi login dari Network
                    network.loginApi(email, password).then((loggedIn) {
                      if (loggedIn) {
                        // Jika login berhasil, Anda dapat melakukan navigasi atau menampilkan pesan sukses.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dashboard(),
                          ),
                        );
                      } else {
                        // Jika login gagal, tampilkan pesan error.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Login failed. cek email dan password.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    });
                  },
                  color: darkdarkBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _buildFooterLogo(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooterLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/Login.png',
          height: 200,
        ),
      ],
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    IconData icon,
    String labelText, {
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: grayColor,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: darkdarkBlueColor),
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          labelText: labelText,
          labelStyle: TextStyle(color: semiblueColor),
          icon: Icon(
            icon,
            color: semiblueColor,
          ),
          border: InputBorder.none,
          suffixIcon: obscureText
              ? IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: semiblueColor,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
