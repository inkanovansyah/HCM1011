import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/leave/leave.dart';
import 'package:hcm1011/presentasion/widgets/leave/cardRequest.dart';

class Leave extends StatefulWidget {
  const Leave({super.key});

  @override
  State<Leave> createState() => _leaveState();
}

class _leaveState extends State<Leave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor, // Mengatur warna biru gelap
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Leave Request',
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous page
          },
        ),
      ),
      backgroundColor: Color(0xffEEF2FD),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ClipRRect(
                      child: Container(
                        height: MediaQuery.of(context).size.height *
                            0.20, // 15% of screen height
                        width: MediaQuery.of(context).size.width,
                        color:
                            darkdarkBlueColor, // Background color (darkdarkBlueColor)
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(
                        255, 245, 251, 255), // Mengatur warna abu-abu
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        CardRequest(
                          label_1: 'leave Request',
                          label_2: 'Sept, 12 - Sept, 12 2023',
                          topRightLabel: 'Approved',
                          status: 'Approved',
                        ),
                        SizedBox(
                          height:
                              10, // Sesuaikan dengan tinggi yang Anda inginkan
                        ),
                        CardRequest(
                          label_1: 'leave Request',
                          label_2: 'Sept, 12 - Sept, 12 2023',
                          topRightLabel: 'Declined',
                          status: 'Declined',
                        ),
                        SizedBox(
                          height:
                              10, // Sesuaikan dengan tinggi yang Anda inginkan
                        ),
                        CardRequest(
                          label_1: 'leave Request',
                          label_2: 'Sept, 12 - Sept, 12 2023',
                          topRightLabel: 'Declined',
                          status: 'Declined',
                        ),
                        SizedBox(
                          height:
                              10, // Sesuaikan dengan tinggi yang Anda inginkan
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            leaveW(),
            Positioned(
              bottom: 20, // Jarak dari bawah layar
              right: 20, // Jarak dari kanan layar
              child: ElevatedButton(
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
                      return Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Logic to handle form submission
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                primary: Color(0xffD0D9F3),
                              ),
                              child: Text('Submit'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: 16, horizontal: 20), // Padding tombol
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8)), // Bentuk tombol (bordes melengkung)
                  primary: Color(0xffD0D9F3), // Warna latar belakang
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ), // Warna ikon hitam), // Icon pensil (Icons.edit)
                    SizedBox(width: 8), // Jarak antara ikon dan teks
                    Text(
                      'Request',
                      style: TextStyle(color: Colors.black),
                    ), // Teks 'Request'
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
