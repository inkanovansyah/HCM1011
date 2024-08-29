import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/widgets/booking/booking_room.dart';
import 'package:hcm1011/presentasion/widgets/body/form_booking_room.dart';

class PageBookingRoom extends StatefulWidget {
  const PageBookingRoom({super.key});

  @override
  State<PageBookingRoom> createState() => _PageBookingRoomState();
}

class _PageBookingRoomState extends State<PageBookingRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF2FD),
      body: Column(
        children: [
          Expanded(
            child: CardBookingRoom(),
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 10,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => bodyFromRoom(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: Color(0xffD0D9F3),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Request',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
