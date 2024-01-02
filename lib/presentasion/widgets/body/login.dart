import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/data/service/api_login.dart';
import 'package:hcm1011/presentasion/widgets/menunavigasi/menu.dart';

class BodyLogin extends StatefulWidget {
  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final NetworkLogin network = NetworkLogin();
  bool isLoading = false; // Define isLoading here

  void initState() {
    super.initState();
    // Panggil fungsi untuk memeriksa status login saat aplikasi dimulai
    checkInitialLogin();
  }

  Future<void> checkInitialLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLogin') ?? false;

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MenuNavigasi(
            imagePath: '',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Welcome, Heroes!',
                        textAlign: TextAlign.start,
                        style: openSensBoldDark.copyWith(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Yuk login teman teman',
                        textAlign: TextAlign.start,
                        style: openSensBoldDark.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
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
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          final email = emailController.text;
                          final password = passwordController.text;

                          setState(() {
                            // Set a flag to indicate loading
                            isLoading = true;
                          });

                          bool loggedIn =
                              await network.loginApi(email, password);
                          setState(() {
                            // Set the loading flag to false once login process completes
                            isLoading = false;
                          });

                          if (loggedIn) {
                            await network.chackLogin();
                            // If login is successful, navigate to the next screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MenuNavigasi(
                                  imagePath: '',
                                ),
                              ),
                            );
                          } else {
                            // If login fails, show an error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Login failed. Check email and password.'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: darkdarkBlueColor,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator() // Show CircularProgressIndicator when loading
                      : Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                ),
              ),
              SizedBox(
                height: 30,
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
                    setState(
                      () {
                        isPasswordVisible = !isPasswordVisible;
                      },
                    );
                  },
                )
              : null,
        ),
      ),
    );
  }
}
