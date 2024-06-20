import 'package:flutter/material.dart';
import 'package:hcm1011/data/model/info.dart';
import 'dart:math';
import 'package:hcm1011/presentasion/widgets/body/card_dashboard.dart';
import 'package:hcm1011/presentasion/widgets/body/dashboard.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

import 'package:hcm1011/presentasion/widgets/body/cardInfgo.dart';
import 'package:hcm1011/presentasion/widgets/body/button_login.dart';

import 'package:hcm1011/presentasion/widgets/carousel_info/carousel_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_story/bloc_list_story_bloc.dart';
import 'package:hcm1011/data/model/liststory.dart';

class Dashboard extends StatefulWidget {
  static String route = "/dashboard";

  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<Dashboard> {
  void initState() {
    Future.microtask(
      () => context.read<BlocListStoryBloc>().add(const Fetchlist()),
    );
    super.initState();
  }

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
                label_1: 'Form KPI JUNI 2024',
                label_2: '20%',
                img: 'assets/images/Asset_2.png',
                color: 'blue',
                colorText: 'white',
              ),
              CardInfo(
                label_1: 'Leave Balance',
                label_2: '-',
                img: 'assets/images/Asset_1.png',
                color: 'white',
                colorText: 'blue',
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
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
            child: _buildCarousel(context), // Langsung memanggil _buildCarousel
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

  Widget _buildCarousel(BuildContext context) {
    return BlocBuilder<BlocListStoryBloc, BlocListStoryState>(
      builder: (context, state) {
        if (state is BlocListStoryLoading) {
          return SizedBox(
            height: 100, // Sesuaikan dengan kebutuhan
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is BlocListStoryLoaded) {
          return SizedBox(
            height: 438.0,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              itemCount: state.storyList?.length ?? 0,
              itemBuilder: (context, index) {
                return _buildCarouselItem(context, state.storyList![index]);
              },
            ),
          );
        } else if (state is BlocListStoryError) {
          return Center(child: Text(state.message));
        } else {
          return SizedBox(
            height: 100,
            child: Center(child: Text('Data kosong...')),
          );
        }
      },
    );
  }

  Widget _buildCarouselItem(BuildContext context, Datums datums) {
    // Asumsi Story adalah kelas model Anda dengan properti yang relevan
    final id = datums.storyId;
    final name = datums.nameFile;
    final date = datums.createAt;
    final media = datums.source;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          color: Colors.grey,
          child: Stack(
            children: [
              Positioned.fill(
                child: Transform.rotate(
                  angle: -pi / 2, // Rotasi 90 derajat ke kiri
                  child: Image.network(
                    '$media', // Ganti dengan URL gambar Anda
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$name $id',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '$date',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
