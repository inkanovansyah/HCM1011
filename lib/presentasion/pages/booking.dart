import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/body/body_booking_car.dart';
import 'package:hcm1011/presentasion/widgets/body/body_booking_room.dart';

class PageBooking extends StatefulWidget {
  const PageBooking({Key? key}) : super(key: key);

  @override
  State<PageBooking> createState() => _PageBooking();
}

class _PageBooking extends State<PageBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Booking',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous page
          },
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Color(0xff202449),
              indicatorWeight: 4,
              labelColor: darkdarkBlueColor,
              unselectedLabelColor: darkdarkBlueColor,
              tabs: [
                Tab(text: 'Car Booking'),
                Tab(text: 'Room Booking'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Tam
                  cardBookingCar(),
                  PageBookingRoom(),
                  // Tambahkan widget lain untuk konten Tab kedua di sini
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
