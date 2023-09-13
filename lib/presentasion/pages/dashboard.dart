import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/widgets/body/cardDashboard.dart';
import 'package:hcm1011/presentasion/widgets/body/dashboard.dart';
import 'package:hcm1011/presentasion/widgets/body/date.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/pages/profile.dart';

class dashboard extends StatefulWidget {
  // const name({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PT Sepuluh Sebelas Group'),
        automaticallyImplyLeading: false,
        leading: null,
        elevation: 0.0,
        backgroundColor: darkdarkBlueColor,
      ),
      endDrawer: Drawer(
        // Isi drawer dengan menu atau widget yang Anda inginkan
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyProfile(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Menu 2'),
              onTap: () {
                // Tambahkan fungsi yang ingin Anda jalankan saat menu 2 diklik
              },
            ),
            // Tambahkan menu lain sesuai kebutuhan
          ],
        ),
      ),
      body: ListView(
        children: [
          bodyDashboard(),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Today Schedule',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          date(),
          cardSchedule(
            label_1: 'Wardhatul Aini',
            label_2: 'HR Manager',
            label_3: 'Meeting MOD',
            img: 'assets/images/Profile.png',
          ),
          SizedBox(
            height: 10.0,
          ),
          cardSchedule(
            label_1: 'Wardhatul Aini',
            label_2: 'HR Manager',
            label_3: 'Meeting MOD',
            img: 'assets/images/Profile.png',
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
