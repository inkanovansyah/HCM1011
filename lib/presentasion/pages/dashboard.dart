import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hcm1011/presentasion/bloc/bloc_kpi/kpi_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
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
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

import 'package:hcm1011/presentasion/bloc/bloc_delate_story/delate_story_bloc.dart';

class Dashboard extends StatefulWidget {
  // static String route = "/dashboard";

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
    // super.initState();
  }

  void showSessionTimeoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.info_outline,
                size: 50,
                color: Colors.grey,
              ),
              SizedBox(height: 16.0),
              Text(
                "Session Timeout!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "You have been logged out due to inactivity.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context)
                      .pushReplacementNamed('/login'); // Navigate to login
                },
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (token.isNotEmpty) {
      // If the token exists, check if it is expired
      bool isExpired = JwtDecoder.isExpired(token);

      if (isExpired) {
        // Token is expired, show session timeout dialog and redirect to login
        showSessionTimeoutDialog(context);
      } else {
        // Token is valid, proceed as normal
        // You can also check if you need to refresh the token here
      }
    } else {
      // Token does not exist, redirect to login
      showSessionTimeoutDialog(context);
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
    return BlocListener<DelateStoryBloc, DelateStoryState>(
      listener: (context, state) {
        if (state is DelateStoryLoaded) {
          context.read<BlocListStoryBloc>().add(Fetchlist());
        }
      },
      child: BlocBuilder<BlocListStoryBloc, BlocListStoryState>(
        builder: (context, state) {
          if (state is BlocListStoryLoading) {
            return SizedBox(
              height: 100,
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (state is BlocListStoryLoaded) {
            if (state.storyList == null || state.storyList!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/status/no_info.png'),
                    SizedBox(height: 6),
                    Text(
                      'No data available',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }

            return SizedBox(
              height: 438.0, // Ketinggian PageView
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.8),
                itemCount: state.storyList!
                    .length, // Hitung berdasarkan semua data, tidak difilter di sini
                itemBuilder: (context, index) {
                  final story =
                      state.storyList![index]; // Ambil item sesuai urutan

                  // Pengecekan untuk is_delete == '0'
                  if (story.is_delete == '0') {
                    return _buildCarouselItem(
                        context, story); // Tampilkan item jika is_delete == '0'
                  } else {}
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
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, Datums datums) {
    final employeeIdStory = datums.employeeId; // Employee ID from the story
    final name = datums.nameFile;
    final date = datums.createAt;
    final media = datums.source;
    final description = datums.description;
    final delete = datums.is_delete;
    final storyId = datums.storyId;

    return FutureBuilder<String?>(
      future: _getEmployeeIdFromSharedPreferences(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          final employeeIdPrefs = snapshot.data;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: Colors.grey,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      '$media',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(4),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$name',
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
                              SizedBox(height: 4),
                              Text(
                                '$description',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: darkdarkBlueColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () async {
                          await _saveImage(media);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // Red background
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(8.0), // Adjust size as needed
                          child: Icon(
                            Icons.download,
                            color: Colors.black, // Icon color
                          ),
                        ),
                      ),
                    ),
                    if (employeeIdStory == employeeIdPrefs)
                      Positioned(
                        top: 60,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            if (storyId != null) {
                              context
                                  .read<DelateStoryBloc>()
                                  .add(DeleteStory(id: storyId));
                            } else {
                              // Handle case where id is null, maybe show a snackbar or an error message
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red, // Red background
                              shape: BoxShape.circle,
                            ),
                            padding:
                                EdgeInsets.all(8.0), // Adjust size as needed
                            child: Icon(
                              Icons.delete,
                              color: Colors.white, // Icon color
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
      },
    );
  }

  Future<void> _requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  Future<void> _saveImage(String? imageUrl) async {
    if (imageUrl == null) {
      Fluttertoast.showToast(
          msg: "URL gambar tidak valid.", backgroundColor: Colors.red);
      return;
    }
    await _requestPermission();

    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      final result = await ImageGallerySaver.saveImage(
        response.bodyBytes,
        quality: 100,
        name: "image_${DateTime.now().millisecondsSinceEpoch}.png",
      );

      if (result['isSuccess']) {
        Fluttertoast.showToast(
            msg: "Image saved successfully!", backgroundColor: Colors.black);
      } else {
        Fluttertoast.showToast(
            msg: "Failed to save image.", backgroundColor: Colors.red);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Failed to load image.", backgroundColor: Colors.red);
    }
  }

  Future<String?> _getEmployeeIdFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(
        'employee_id'); // Assuming you stored the employeeId with this key
  }

  void _showDeleteConfirmationDialog(BuildContext context, Datums datums) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Deletion"),
          content: Text("Are you sure you want to delete this story?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text("Delete"),
              onPressed: () {
                // Implement your deletion logic here
                // For example, call a delete API or remove from the list
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
