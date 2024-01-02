import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/widgets/body/card_dashboard.dart';
import 'package:hcm1011/presentasion/widgets/body/dashboard.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

import 'package:hcm1011/presentasion/widgets/body/cardInfgo.dart';
import 'package:hcm1011/presentasion/widgets/body/button_login.dart';

import 'package:hcm1011/presentasion/widgets/carousel_info/carousel_info.dart';
import 'package:hcm1011/presentasion/widgets/cardStory/card_story.dart';

class Dashboard extends StatefulWidget {
  static String route = "/dashboard";

  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hapus properti ini
        leading: null, // Hapus properti ini
        elevation: 0.0,
        backgroundColor: darkdarkBlueColor,
        toolbarHeight: 10.0,
      ),
      backgroundColor: Color.fromARGB(255, 245, 251, 255),
      body: ListView(
        children: [
          BodyDashboard(),
          InfoCarousel(),
          Row(
            children: [
              SizedBox(
                width: 9,
              ),
              CardInfo(
                label_1: 'Attendance Strike',
                label_2: '30',
                img: 'assets/images/Asset_2.png',
                color: 'blue',
                colorText: 'white',
              ),
              CardInfo(
                label_1: 'Leave Balance',
                label_2: '2',
                img: 'assets/images/Asset_1.png',
                color: 'white',
                colorText: 'blue',
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Todays Focus',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          CardSchedule(),
          SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Hero s Stories',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 440.0,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (index % 2 == 0) {
                  return _buildCarousel(context, index);
                }
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          AddButton(),
          SizedBox(
            height: 8.0,
          ),
          // Container(
          //   width: 200,
          //   height: 100,
          //   child: Image.asset(
          //       'assets/banner/logo.png'), // Ganti 'your_image.png' dengan path gambar Anda
          // ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 438.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      child: Container(
        child: cardStory(
          img: 'assets/test/Storytest.png',
        ),
      ),
    );
  }
}
