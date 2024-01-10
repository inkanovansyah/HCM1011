import 'package:flutter/material.dart';
import 'package:hcm1011/data/service/api_login.dart';
import 'package:hcm1011/presentasion/pages/loading.dart';

class SettingCard extends StatefulWidget {
  const SettingCard({Key? key}) : super(key: key);

  @override
  State<SettingCard> createState() => _SettingState();
}

class _SettingState extends State<SettingCard> {
  final Logout _logout = Logout(); // Instance of the Logout class
  bool _loggingOut = false;

  Future<void> _performLogout() async {
    // Show an AlertDialog to confirm logout
    bool confirmLogout = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(false); // User does not want to log out
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // User confirmed log out
              },
              child: Text('Log Out'),
            ),
          ],
        );
      },
    );

    // If the user confirmed logout, proceed with the actual logout
    if (confirmLogout == true) {
      setState(() {
        _loggingOut = true; // Set loggingOut to true to show loading modal
      });

      await _logout.logout('dude NOVANSYAH'); // Call the logout function

      setState(() {
        _loggingOut = false; // Set loggingOut to false after logout completes
      });

      // Redirect the user to the login screen or any appropriate screen
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewExample(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 20),
                            ClipOval(
                              child: Container(
                                width: 40,
                                height: 40,
                                color: Colors.white, // Warna latar belakang
                                child: Icon(
                                  Icons
                                      .help_outline_rounded, // Ganti dengan ikon yang diinginkan
                                  color: Colors.black, // Warna ikon
                                  size: 30, // Ukuran ikon
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Help & Support',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _performLogout();
                      print('log_out');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 20),
                            ClipOval(
                              child: Container(
                                width: 40,
                                height: 40,
                                color: Colors.white, // Warna latar belakang
                                child: Icon(
                                  Icons
                                      .output_rounded, // Ganti dengan ikon yang diinginkan
                                  color: Colors.black, // Warna ikon
                                  size: 30, // Ukuran ikon
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Log Out',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // Loading modal with CircularProgressIndicator
            if (_loggingOut) LoadingAlertDialog(),
          ],
        ),
      ),
    );
  }
}

class LoadingAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 100,
        height: 100,
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
