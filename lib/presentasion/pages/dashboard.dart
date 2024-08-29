import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hcm1011/presentasion/bloc/bloc_kpi/kpi_bloc.dart';
import 'dart:math';
import 'package:hcm1011/presentasion/widgets/body/card_dashboard.dart';
import 'package:hcm1011/presentasion/widgets/body/dashboard.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

import 'package:hcm1011/presentasion/widgets/body/cardInfo_one.dart';
import 'package:hcm1011/presentasion/widgets/body/cardInfo_two.dart';
import 'package:hcm1011/presentasion/widgets/body/button_login.dart';

import 'package:hcm1011/presentasion/widgets/carousel_info/carousel_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_story/bloc_list_story_bloc.dart';
import 'package:hcm1011/data/model/liststory.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  static String route = "/dashboard";

  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTime? lastPressed;

  @override
  void dispose() {
    Future.microtask((() => context.read<KpiBloc>().add(const GetListKpi())));
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    Future.microtask(
      () => context.read<BlocListStoryBloc>().add(const Fetchlist()),
    );
    super.initState();
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (token.isEmpty) {
      // Navigate to login page if not logged in
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      // Navigate to dashboard page if logged in
      Navigator.of(context).pushReplacementNamed('/dashboard');
    }
  }

  Future<bool> _onWillPop() async {
    final now = DateTime.now();
    final maxDuration = Duration(seconds: 2);
    final isWarning =
        lastPressed == null || now.difference(lastPressed!) > maxDuration;

    if (isWarning) {
      lastPressed = DateTime.now();
      Fluttertoast.showToast(
        msg: 'Klik sekali lagi untuk keluar',
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return false;
    } else {
      SystemNavigator.pop();
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: darkdarkBlueColor,
          toolbarHeight: 0.0,
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
                CardInfoOne(),
                SizedBox(
                  width: 8,
                ),
                CardInfoTwo(),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Today\'s Focus',
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
                'Heroes Stories',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 440.0,
              child: _buildCarousel(context),
            ),
            SizedBox(
              height: 20.0,
            ),
            AddButton(),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return BlocBuilder<BlocListStoryBloc, BlocListStoryState>(
      builder: (context, state) {
        if (state is BlocListStoryLoading) {
          return SizedBox(
            height: 100,
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
              Align(
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: -pi / 2,
                  child: Container(
                    child: Image.network(
                      '$media',
                      fit: BoxFit.cover,
                    ),
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
