import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/widgets/body/cardDashboard.dart';
import 'package:hcm1011/presentasion/widgets/body/Dashboard.dart';
import 'package:hcm1011/presentasion/widgets/leave/leave.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/pages/leave.dart';
import 'package:hcm1011/presentasion/pages/InfoUpdate.dart';
// import 'package:hcm1011/presentasion/pages/profile.dart';

class Dashboard extends StatefulWidget {
  // const name({super.key});

  @override
  State<Dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        elevation: 0.0,
        backgroundColor: darkdarkBlueColor,
        // title: Container(
        //   height: kToolbarHeight,
        //   decoration: BoxDecoration(
        //     color: Color(0xFFECF0FB),
        //     borderRadius: BorderRadius.circular(40.0),
        //   ),
        //   child: Container(
        //     margin: EdgeInsets.symmetric(
        //         vertical: 11.0), // Jarak atas dan bawah 4 piksel
        //     child: TextField(
        //       decoration: InputDecoration(
        //         hintText: 'Search',
        //         border: InputBorder.none,
        //         contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        //         prefixIcon: Icon(Icons.search),
        //       ),
        //     ),
        //   ),
        // ),
      ),
      backgroundColor: Color.fromARGB(255, 245, 251, 255),
      body: ListView(
        children: [
          BodyDashboard(),
          SizedBox(
            height: 10.0,
          ),
          // Container(
          //   color: Color.fromARGB(
          //       255, 232, 232, 232), // Set the background color here
          //   child: SizedBox(
          //     height: 10.0,
          //   ),
          // ),
          SizedBox(
            height: 10.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Summary',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Todays Schedule',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          leaveW(),
          SizedBox(
            height: 5.0,
          ),
          CardSchedule(
            label_1: 'Meeting HOD (Oct 2023)',
            label_2: 'Wardatul Aini',
            label_3: 'Meeting MOD',
            img: 'assets/images/Profile.png',
          ),
          SizedBox(
            height: 10.0,
          ),
          CardSchedule(
            label_1: 'HBD Vivagoal',
            label_2: 'Dimas S',
            label_3: 'Meeting MOD',
            img: 'assets/images/Profile.png',
          ),
          SizedBox(
            height: 30.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Info & Update',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),

          // SizedBox(
          //   height: 10.0,
          // ),
          // Container(
          //   color: Color.fromARGB(
          //       255, 232, 232, 232), // Set the background color here
          //   child: SizedBox(
          //     height: 10.0,
          //   ),
          // ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 40),
        child: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              // Tampilkan menu ketika ikon kamera diklik
              showMenu(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Atur border radius sesuai kebutuhan
                ),
                context: context,
                position: const RelativeRect.fromLTRB(400, 500, 86, 0),
                items: [
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: () {
                        // Add your action here when the menu item is pressed
                        print('KPI pressed'); // Example action: print a message
                      },
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today), // Icon
                          VerticalDivider(
                            color: Colors.grey, // Set the color to gray
                          ), // Vertical Divider Line
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ), // Adjust padding as needed
                            child: Text('KPI'), // Text Title
                          ),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => leave(),
                          ),
                        );
                        // Add your action here when the menu item is pressed
                        print(
                            'leave pressed'); // Example action: print a message
                      },
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today), // Icon
                          VerticalDivider(
                            color: Colors.grey, // Set the color to gray
                          ), // Vertical Divider Line
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ), // Adjust padding as needed
                            child: Text('Leave Request'), // Text Title
                          ),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PagesUpdate(),
                          ),
                        );
                        // Add your action here when the menu item is pressed
                        print(
                            'Update pressed'); // Example action: print a message
                      },
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today), // Icon
                          VerticalDivider(
                            color: Colors.grey, // Set the color to gray
                          ), // Vertical Divider Line
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ), // Adjust padding as needed
                            child: Text('Info & Update'), // Text Title
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                elevation: 3.0,
              );
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 4),
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  startAngle: 0.0,
                  endAngle: 2 * 3.1415,
                  colors: [
                    Color(0xFF1BEFC7),
                    Color(0xFFF993E5),
                    Color(0xFFFFF1CA),
                    Color(0xFF62F4F4),
                  ],
                ),
              ),
              child:
                  Image.asset('assets/images/icon.png', width: 60, height: 60),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 202, 202, 202).withOpacity(0.5),
                  spreadRadius: 8,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: Colors.white,
                selectedItemColor: darkblueColor,
                unselectedItemColor: bluesskyColors,
                selectedFontSize: 16,
                selectedIconTheme: IconThemeData(size: 30),
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_1.png'),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_2.png'),
                    label: 'Order',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.mail),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_3.png'),
                    label: 'Inbox',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_4.png'),
                    label: 'Account',
                  ),
                ],
                type: BottomNavigationBarType.fixed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
