import 'package:flutter/material.dart';
import 'package:hcm1011/data/service/api_profile.dart';

import 'package:hcm1011/data/model/failure_exception.dart';

class profile extends StatefulWidget {
  // const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String? email; // Make the variables nullable
  String? fullname;
  String? positionname;
  String? nik;
  String? dob;
  String? pob;
  String? media;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      Profile profile = Profile();
      Map<String, String> data = await profile.fetchDataProfile();

      setState(() {
        email = data['email'];
        fullname = data['fullname'];
        positionname = data['position_name'];
        nik = data['nik'];
        dob = data['dob'];
        pob = data['pob'];
        media = data['media'];
      });
    } on FailureException catch (e) {
      // Handle FailureException
      print('Exception: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      right: 10,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1.0, // Ubah sesuai kebutuhan
        height: 180, // Ubah sesuai kebutuhan
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 100.0,
                  height: 150.0,
                  child: Stack(
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(
                              media != null
                                  ? '$media'
                                  : 'assets/images/default.png',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 7,
                        right: 20,
                        child: Container(
                          child: Image.asset(
                            'assets/images/Logo_profile.png', // Ganti dengan path gambar kustom Anda
                            width:
                                50.0, // Sesuaikan ukuran gambar dengan kebutuhan
                            height: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 14.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullname ?? 'Data tidak tersedia',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      positionname ?? 'Data tidak tersedia',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          'NIK',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(width: 79), // Jarak antara 'NIK' dan nilai
                        Text(
                          '${nik ?? 'Data tidak tersedia'}',
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          'Birth Place',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(width: 35), // Jarak antara 'NIK' dan nilai
                        Text(
                          '${pob ?? 'Data tidak tersedia'}',
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          'Birth Date',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(width: 43), // Jarak antara 'NIK' dan nilai
                        Text(
                          '${dob ?? 'Data tidak tersedia'}',
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(width: 70), // Jarak antara 'NIK' dan nilai
                        Text(
                          '${email ?? 'Data tidak tersedia'}',
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
