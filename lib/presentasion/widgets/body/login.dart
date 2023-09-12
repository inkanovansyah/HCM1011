import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/pages/dashboard.dart';

class bodyLogin extends StatefulWidget {
  // const name({super.key});

  @override
  State<bodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<bodyLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                    emailController, Icons.account_circle, 'Email'),
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
                child:
                    _buildTextField(passwordController, Icons.lock, 'Password'),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => dashboard(),
                      ),
                    );
                  },
                  color: darkdarkBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Sesuaikan dengan radius yang Anda inginkan
                  ),
                  child: Text('Continue',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
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

  _buildFooterLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/LOgin.png',
          height: 200,
        ),
      ],
    );
  }

  _buildTextField(
      TextEditingController controller, IconData icon, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        color: grayColor,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: semiblueColor),
            icon: Icon(
              icon,
              color: semiblueColor,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}
