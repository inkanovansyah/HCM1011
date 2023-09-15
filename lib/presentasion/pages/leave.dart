import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/leave/leave.dart';

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
        title: Text('Leave Request'),
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
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              '13 Septembar 2023',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          leaveW(
            label_1: 'Leave',
            label_2: 'Status',
            label_3: 'Duration',
            label_4: 'Note',
            leave: 'Cuti Tahunan',
            status: 'Apply',
            durasi: '13-09-2023 16-09-2023',
            note: '',
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              '12 Septembar 2023',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 6, bottom: 6),
                child: Text(
                  'Tidak Ada Pengajuan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              '11 Septembar 2023',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 6, bottom: 6),
                child: Text(
                  'Tidak Ada Pengajuan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              '10 Septembar 2023',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 6, bottom: 6),
                child: Text(
                  'Tidak Ada Pengajuan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              '09 Septembar 2023',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          leaveW(
            label_1: 'Leave',
            label_2: 'Status',
            label_3: 'Duration',
            label_4: 'Note',
            leave: 'Cuti Tahunan',
            status: 'Apply',
            durasi: '13-09-2023 16-09-2023',
            note: '',
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
