import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/pages/dashboard.dart';
import 'package:intl/intl.dart';

import 'package:hcm1011/presentasion/pages/payroll.dart';
import 'package:hcm1011/presentasion/pages/profile.dart';
import 'package:hcm1011/presentasion/pages/my_attandance.dart';

import 'package:hcm1011/presentasion/pages/leave.dart';
import 'package:hcm1011/presentasion/pages/trainings.dart';
import 'package:hcm1011/presentasion/pages/kpi.dart';

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
  late payrollDetailArgument arg;
  @override
  void initState() {
    super.initState();
    // Inisialisasi arg di sini
    print(currentMonth);
    arg = payrollDetailArgument(month: currentMonth);
  }

  // final List<Widget> _screens = [
  //   Dashboard(), // Buat HomePage() dan halaman lainnya sesuai kebutuhan.
  //   MyAttandance(
  //     imagePath: '',
  //   ),
  //   MyAttandance(
  //     imagePath: '',
  //   ),
  //   PayRoll(argument: arg),
  //   MyProfile()
  // ];

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
      PayRoll(argument: arg),
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
                icon: _currentIndex == 3
                    ? SizedBox(
                        height: 28, // Atur tinggi sesuai kebutuhan Anda
                        width: 28, // Atur lebar sesuai kebutuhan Anda
                        child: Image.asset(
                          'assets/images/icon_3_ac.png',
                        ),
                      )
                    : SizedBox(
                        height: 24, // Atur tinggi sesuai kebutuhan Anda
                        width: 24, // Atur lebar sesuai kebutuhan Anda
                        child: Image.asset('assets/images/icon_3.png'),
                      ),
                label: 'Payroll',
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
                    height: 240,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  'Pilih Menu',
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
