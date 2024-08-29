import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hcm1011/presentasion/pages/dashboard.dart';

import 'package:hcm1011/presentasion/pages/notifikasi.dart';
import 'package:hcm1011/presentasion/pages/profile.dart';
import 'package:hcm1011/presentasion/pages/my_attandance.dart';
import 'package:hcm1011/presentasion/bloc/bloc_notification/notification_bloc.dart';

import 'package:hcm1011/presentasion/pages/leave.dart';
import 'package:hcm1011/presentasion/pages/trainings.dart';
import 'package:hcm1011/presentasion/pages/kpi.dart';
import 'package:hcm1011/presentasion/pages/booking.dart';

class MenuNavigasi extends StatefulWidget {
  final String imagePath;

  MenuNavigasi({required this.imagePath});
  // const MenuNavigasi({Key? key}) : super(key: key);

  @override
  _NavigasiState createState() => _NavigasiState();
}

class _NavigasiState extends State<MenuNavigasi> {
  int _currentIndex = 0;
  // String currentMonth = DateFormat('M').format(DateTime.now());
  String currentMonth = '12';

  @override
  void initState() {
    Future.microtask(
      () => context.read<NotificationBloc>().add(
            GetNotificationList(),
          ),
    );
    super.initState();
  }

  void _navigateToPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildMenuTile(String title, String imagePath, Function() onTap) {
    return ListTile(
      leading: Ink(
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(imagePath),
        ),
      ),
      title: Text(title),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      Dashboard(),
      MyAttandance(imagePath: ''),
      MyAttandance(imagePath: ''),
      PayRoll(),
      MyProfile()
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false, //
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
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
            currentIndex: _currentIndex,
            onTap: (index) {
              _navigateToPage(index);
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: _currentIndex == 0
                    ? SizedBox(
                        height: 28, // Atur tinggi sesuai kebutuhan Anda
                        width: 28, // Atur lebar sesuai kebutuhan Anda
                        child: Image.asset(
                          'assets/images/icon_1_ac.png',
                        ),
                      )
                    : SizedBox(
                        height: 24, // Atur tinggi sesuai kebutuhan Anda
                        width: 24, // Atur lebar sesuai kebutuhan Anda
                        child: Image.asset('assets/images/icon_1.png'),
                      ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _currentIndex == 1
                    ? SizedBox(
                        height: 28, // Atur tinggi sesuai kebutuhan Anda
                        width: 28, // Atur lebar sesuai kebutuhan Anda
                        child: Image.asset(
                          'assets/images/icon_2_ac.png',
                        ),
                      )
                    : SizedBox(
                        height: 24, // Atur tinggi sesuai kebutuhan Anda
                        width: 24, // Atur lebar sesuai kebutuhan Anda
                        child: Image.asset('assets/images/icon_2.png'),
                      ),
                label: 'My Card',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.mail),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: BlocBuilder<NotificationBloc, NotificationState>(
                  builder: (context, state) {
                    int unreadCount = 0; // Set default value to 0

                    if (state is NotificationLoaded) {
                      // Get the list of notifications
                      final notifications = state.notificationList?.data?.data;

                      // Print notifications for debugging
                      print("Notifications: $notifications");

                      // Filter notifications where isRead is "0"
                      unreadCount = notifications
                              ?.where((notif) =>
                                  notif?.isRead ==
                                  "0") // Check if isRead is "0"
                              ?.length ??
                          0; // Use 0 if no unread notifications found
                    }

                    return Stack(
                      children: <Widget>[
                        _currentIndex == 3
                            ? SizedBox(
                                height: 28,
                                width: 28,
                                child:
                                    Image.asset('assets/images/icon_3_ac.png'),
                              )
                            : SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset('assets/images/icon_3.png'),
                              ),
                        if (unreadCount > 0)
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Center(
                                child: Text(
                                  '$unreadCount',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                label: 'Notification',
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

      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 40),
        child: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 300,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  'Select Menu',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView(
                              children: <Widget>[
                                _buildMenuTile(
                                    'Booking', 'assets/images/icon_modal_1.png',
                                    () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PageBooking(),
                                    ),
                                  );
                                }),
                                SizedBox(
                                  height: 2,
                                ),
                                _buildMenuTile('Trainings',
                                    'assets/images/icon_modal_1.png', () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PagesUpdate(),
                                    ),
                                  );
                                }),
                                SizedBox(
                                  height: 2,
                                ),
                                _buildMenuTile(
                                    'KPI', 'assets/images/icon_modal_2.png',
                                    () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Kpi(),
                                    ),
                                  );
                                }),
                                SizedBox(
                                  height: 2,
                                ),
                                _buildMenuTile('Leave Request',
                                    'assets/images/icon_modal_3.png', () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Leave(),
                                    ),
                                  );
                                }),

                                // Add other menu items similarly
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MenuNavigasi(
      imagePath: '',
    ),
  ));
}
