import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/MyProfile/userprofile.dart';
import 'package:hcm1011/presentasion/widgets/MyProfile/datauser.dart';
import 'package:hcm1011/presentasion/widgets/MyProfile/chart.dart';

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
        backgroundColor: darkdarkBlueColor, // Mengatur warna biru gelap
        centerTitle: true,
        title: Text('My Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Tambahkan fungsi yang ingin Anda jalankan saat ikon "edit" diklik
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          profile(
            nama: 'Wardhatul Aini',
            jabatan: 'HR Manager',
          ),
          SizedBox(
            height: 20,
          ),
          dataProfile(
            name: 'Wardhatul Aini',
            jabatan: 'HR Manager',
            nik: 'SS.0020.0002',
            temlahir: 'Jakarta',
            tanglahir: '20 September 2023',
            email: 'wir@1011.id',
            hp: '08939949955',
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Performance',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Task Per Day',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          viewchart(),
        ],
      ),
    );
  }
}
