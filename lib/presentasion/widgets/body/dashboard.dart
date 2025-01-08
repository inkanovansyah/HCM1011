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
  String nik = '';

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
    final nik = prefs.getString('nik') ?? '';

    setState(() {
      this.fullName = fullName;
      this.departmentName = departmentName;
      this.image = image;
      this.nik = nik;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: ClipRRect(
          child: Container(
            height: MediaQuery.of(context).size.height *
                0.10, // 15% dari tinggi layar
            width: MediaQuery.of(context).size.width,
            color: darkdarkBlueColor, // Warna latar belakang
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, top: 12.0, bottom: 12.0),
              child: Row(
                children: [
                  ClipOval(
                    child: Container(
                      width: 60.0, // Sesuaikan ukuran avatar
                      height: 60.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 8,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Menampilkan gambar default jika terjadi kesalahan
                          return Image.asset(
                            'assets/images/Profile_test.png',
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0), // Spasi antara avatar dan teks
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Pusatkan secara vertikal
                      children: [
                        Text(
                          fullName,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4.0), // Spasi antara nama dan ID
                        Text(
                          '$nik - $departmentName', // Tampilkan ID dan nama departemen
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
