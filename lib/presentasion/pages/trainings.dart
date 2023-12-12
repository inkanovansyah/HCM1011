import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/body/InfoUpdate.dart';

class PagesUpdate extends StatefulWidget {
  const PagesUpdate({Key? key}) : super(key: key);

  @override
  State<PagesUpdate> createState() => _PageUpdate();
}

class _PageUpdate extends State<PagesUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Trainings',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous page
          },
        ),
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
                Tab(text: 'Upcoming'),
                Tab(text: 'Past Trainings'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  trainings(
                    title: 'High Grade & Persitence',
                    review:
                        'Planned discussion among  people to exchange ideas',
                    date: '12 nov 2023',
                    imgprofile: 'assets/images/Profile_fo.png',
                    imgcover: 'assets/banner/info.png',
                  ),
                  // Tam

                  trainings(
                    title: 'High Grade & Persitence',
                    review:
                        'Planned discussion among  people to exchange ideas',
                    date: '12 nov 2023',
                    imgprofile: 'assets/images/Profile_fo.png',
                    imgcover: 'assets/banner/info.png',
                  ),
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
