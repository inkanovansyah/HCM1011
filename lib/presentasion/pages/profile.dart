import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/MyProfile/userprofile.dart';
import 'package:hcm1011/presentasion/widgets/MyProfile/datauser.dart';

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
          profile(
            label_1: '',
            label_2: '',
            label_3: '',
            label_4: '',
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
            email: 'Pablo@1011.id',
            hp: '08939949955',
          ),
        ],
      ),
    );
  }
}
