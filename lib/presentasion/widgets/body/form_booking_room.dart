import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/booking/formBookingRoom.dart';

class bodyFromRoom extends StatefulWidget {
  const bodyFromRoom({super.key});

  @override
  State<bodyFromRoom> createState() => _bodyFromRoomState();
}

class _bodyFromRoomState extends State<bodyFromRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Form Booking Room Request',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous page
          },
        ),
      ),
      backgroundColor: Color(0xffEEF2FD),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          FormRoom(),
        ],
      ),
    );
  }
}
