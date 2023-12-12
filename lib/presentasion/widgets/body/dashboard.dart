import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/service/api_login.dart';

class BodyDashboard extends StatefulWidget {
  @override
  State<BodyDashboard> createState() => _BodyDashboardState();
}

class _BodyDashboardState extends State<BodyDashboard> {
  final TextEditingController menuController = TextEditingController();
  bool isLoggedIn = false;
  String fullName = '';
  String departmentName = '';
  String image = '';
  String token = '';

  @override
  void initState() {
    super.initState();
    NetworkLogin();

    // Memanggil metode loadUserInfo saat tampilan dimuat
    loadUserInfo();
  }

  // Metode untuk memuat informasi pengguna dari SharedPreferences
  Future<void> loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final fullName = prefs.getString('fullname') ?? '';
    final departmentName = prefs.getString('position_name') ?? '';
    final image = prefs.getString('image') ?? '';

    setState(() {
      this.fullName = fullName;
      this.departmentName = departmentName;
      this.image = image;
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
              child: Container(
                height: MediaQuery.of(context).size.height *
                    0.14, // 15% of screen height
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
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
                        Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            '$departmentName',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
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
                      child: Image.network(
                        image,
                        fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
                        errorBuilder: (context, error, stackTrace) {
                          // Menambahkan errorBuilder untuk menampilkan gambar default jika terjadi kesalahan
                          return Image.asset(
                            'assets/images/default.png',
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
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
