import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/leave/leave.dart';
import 'package:hcm1011/presentasion/widgets/leave/cardRequest.dart';

class leave extends StatefulWidget {
  const leave({super.key});

  @override
  State<leave> createState() => _leaveState();
}

class _leaveState extends State<leave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor, // Mengatur warna biru gelap
        centerTitle: true,
        // elevation: 0.0,
        title: Text(
          'Leave Request',
          // style: TextStyle(
          //   color: Colors.black, // Mengatur warna teks menjadi hitam
          // ),
        ),
        // iconTheme: IconThemeData(
        //   color: Colors.black, // Mengatur warna ikon menjadi hitam
        // ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
                Icons.add), // Icon yang ingin Anda gunakan untuk tombol "Add"
            onPressed: () {
              // Tindakan yang ingin Anda lakukan saat tombol "Add" ditekan
              // Misalnya, navigasi ke halaman tambah permohonan cuti atau tampilkan dialog.
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          leaveW(),
          Container(
            color: Color.fromARGB(255, 248, 248, 248), // Mengatur warna abu-abu
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CardRequest(
                  label_1: 'leave Request',
                  label_2: 'Sept, 12 - Sept, 12 2023',
                  label_4: 'sick',
                  topRightLabel: 'Approved',
                  status: 'Approved',
                ),
                SizedBox(
                  height: 10, // Sesuaikan dengan tinggi yang Anda inginkan
                ),
                CardRequest(
                  label_1: 'leave Request',
                  label_2: 'Sept, 12 - Sept, 12 2023',
                  label_4: 'sick',
                  topRightLabel: 'Declined',
                  status: 'Declined',
                ),
                SizedBox(
                  height: 10, // Sesuaikan dengan tinggi yang Anda inginkan
                ),
                CardRequest(
                  label_1: 'leave Request',
                  label_2: 'Sept, 12 - Sept, 12 2023',
                  label_4: 'sick',
                  topRightLabel: 'Approved',
                  status: 'Approved',
                ),
                SizedBox(
                  height: 10, // Sesuaikan dengan tinggi yang Anda inginkan
                ),
                CardRequest(
                  label_1: 'leave Request',
                  label_2: 'Sept, 12 - Sept, 12 2023',
                  label_4: 'sick',
                  topRightLabel: 'Approved',
                  status: 'Approved',
                ),
                SizedBox(
                  height: 10, // Sesuaikan dengan tinggi yang Anda inginkan
                ),
                CardRequest(
                  label_1: 'leave Request',
                  label_2: 'Sept, 12 - Sept, 12 2023',
                  label_4: 'sick',
                  topRightLabel: 'Pending',
                  status: 'Pending',
                ),
                SizedBox(
                  height: 10, // Sesuaikan dengan tinggi yang Anda inginkan
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
