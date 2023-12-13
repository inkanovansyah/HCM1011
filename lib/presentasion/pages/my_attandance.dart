import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/date/date_myattandance.dart';
import 'package:hcm1011/presentasion/widgets/today/time_card.dart';

class MyAttandance extends StatefulWidget {
  final String imagePath;

  MyAttandance({required this.imagePath});
  // const MyAttandance({Key key}) : super(key: key);

  @override
  State<MyAttandance> createState() => _MyAttandance();
}

class _MyAttandance extends State<MyAttandance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Card Attendance',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false, // Menghilangkan tombol back
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Color(0xff202449),
              indicatorWeight: 4,
              labelColor: darkdarkBlueColor,
              unselectedLabelColor: darkdarkBlueColor,
              tabs: [
                Tab(text: 'Today'),
                Tab(text: 'History'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TimeCard(
                    imagePath: '',
                  ),
                  DateMyAttandance(),
                  // Tambahkan widget lain untuk konten Tab kedua di sini
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
