import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/MyProfile/userprofile.dart';
import 'package:hcm1011/presentasion/widgets/MyProfile/datauser.dart';
import 'package:hcm1011/presentasion/pages/setting.dart';
import 'package:hcm1011/data/service/api_profile.dart';

import 'package:hcm1011/data/model/failure_exception.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _profileState();
}

class _profileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'My Profile',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false, // Menghilangkan tombol back
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Color(0xffEEF2FD),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ClipRRect(
                      child: Container(
                        height: MediaQuery.of(context).size.height *
                            0.24, // 15% of screen height
                        width: MediaQuery.of(context).size.width,
                        color:
                            darkdarkBlueColor, // Background color (darkdarkBlueColor)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ChartKpi('2023', 15000, 5000),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            profile(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      // body: ListView(
      //   children: [
      //     SizedBox(
      //       height: 20,
      //     ),
      //     profile(
      //       nama: 'Wardhatul Aini',
      //       jabatan: 'HR Manager',
      //     ),
      //     SizedBox(
      //       height: 20,
      //     ),
      //     ChartKpi(),
      //     SizedBox(
      //       height: 20,
      //     ),
      //   ],
      // ),
    );
  }
}
