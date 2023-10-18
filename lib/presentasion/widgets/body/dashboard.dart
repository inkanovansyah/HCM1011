import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/pages/face_recognition.dart';
import 'package:hcm1011/presentasion/pages/attandance.dart';
import 'package:hcm1011/presentasion/pages/leave.dart';
import 'package:hcm1011/presentasion/widgets/navbar/navbar_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/service/ApiLogin.dart';

class BodyDashboard extends StatefulWidget {
  @override
  State<BodyDashboard> createState() => _BodyDashboardState();
}

class _BodyDashboardState extends State<BodyDashboard> {
  final TextEditingController menuController = TextEditingController();
  bool isLoggedIn = false;
  String fullName = '';
  String departmentName = '';

  @override
  void initState() {
    super.initState();
    Network();

    // Memanggil metode loadUserInfo saat tampilan dimuat
    loadUserInfo();
  }

  // Metode untuk memuat informasi pengguna dari SharedPreferences
  Future<void> loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final fullName = prefs.getString('fullname') ?? '';
    final departmentName = prefs.getString('position_name') ?? '';

    setState(() {
      this.fullName = fullName;
      this.departmentName = departmentName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft:
                    Radius.circular(20.0), // Adjust the radius as needed
                bottomRight:
                    Radius.circular(20.0), // Adjust the radius as needed
              ),
              child: Container(
                height: MediaQuery.of(context).size.height *
                    0.15, // 15% of screen height
                width: MediaQuery.of(context).size.width,
                color:
                    darkdarkBlueColor, // Background color (darkdarkBlueColor)
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 12.0),
              child: Row(
                children: [
                  ClipOval(
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/Profile.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$fullName',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '$departmentName',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
