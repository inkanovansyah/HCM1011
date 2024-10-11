import 'dart:convert'; // Tambahkan ini untuk menggunakan jsonDecode
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hcm1011/presentasion/bloc/bloc_boocking/booking_bloc.dart';
import 'package:hcm1011/data/model/booking.dart';
import 'package:hcm1011/presentasion/bloc/bloc_delete_room_booking/delete_booking_room_bloc.dart';

class CardBookingRoom extends StatefulWidget {
  @override
  _CardBookingRoomState createState() => _CardBookingRoomState();
}

class _CardBookingRoomState extends State<CardBookingRoom> {
  DateTime _selectedDay = DateTime.now();
  List<Datum> _bookings = [];
  String? _sharedEmployeeId;

  @override
  void initState() {
    super.initState();
    _loadBookings();
  }

  DateTime _stripTime(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  Future<void> _loadEmployeeId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _sharedEmployeeId = prefs.getString(
          'employee_id'); // Assuming 'employeeId' is stored as a String
    });
  }

  void _loadBookings() {
    DateTime today = _stripTime(DateTime.now());

    if (!_selectedDay.isBefore(today)) {
      context.read<BookingBloc>().add(GetBooking());
    } else {
      setState(() {
        _bookings = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteBookingRoomBloc, DeleteBookingRoomState>(
      listener: (context, state) {
        if (state is DeleteBookingRoomLoaded) {
          context.read<BookingBloc>().add(const GetBooking());
        }
      },
      child: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          if (state is BookingLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BookingLoaded) {
            DateTime today = _stripTime(DateTime.now());

            if (_selectedDay.isBefore(today)) {
              _bookings = []; // Clear bookings for past dates
            } else {
              _bookings = state.bookingList?.data?.where((booking) {
                    final startDate = _stripTime(DateTime(
                      booking.startDate!.year,
                      booking.startDate!.month,
                      booking.startDate!.day,
                    ));
                    return startDate == _selectedDay;
                  }).toList() ??
                  [];
            }

            return Column(
              children: [
                Container(
                  color: Colors.white, // Set background color to white
                  child: CalendarDatePicker(
                    initialDate: _selectedDay,
                    firstDate: _stripTime(
                        DateTime.now()), // Disable dates before today
                    lastDate: DateTime(2030),
                    onDateChanged: (pickedDate) {
                      setState(() {
                        _selectedDay = _stripTime(pickedDate);
                        _loadBookings(); // Reload bookings only if the date is today or in the future
                      });
                    },
                  ),
                ),
                const SizedBox(height: 4.0),
                _buildEventList(),
              ],
            );
          } else if (state is BookingError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Unexpected error...'));
          }
        },
      ),
    );
  }

  Widget _buildEventList() {
    if (_bookings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30), // Jarak atas 30 pixel
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                      'assets/status/no_info.png'), // Replace with your image asset
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'No data available',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30), // Jarak bawah 30 pixel
          ],
        ),
      );
    } else {
      return Expanded(
        child: ListView(
          shrinkWrap: true,
          children: _bookings.map((event) {
            final roomValueString = event.roomValue;
            Map<String, dynamic> roomDetails = {};

            if (roomValueString != null && roomValueString.isNotEmpty) {
              roomDetails = jsonDecode(roomValueString);
            }

            final title = roomDetails['title'] ?? 'Tanpa Judul';
            final description = roomDetails['description'] ?? 'Tanpa Deskripsi';
            final location = roomDetails['location'] ?? 'Tanpa Lokasi';
            final startDate = event.startDate?.toString() ?? 'Tanpa Start_date';
            final endDate = event.endDate?.toString() ?? 'Tanpa End_date';
            final id = event.id?.toString() ?? 'Tanpa ID';
            final roomId = event.roomId?.toString() ?? 'Tanpa Room ID';

            // Convert startDate and endDate to DateTime if they are Strings
            final startTime = DateTime.parse(startDate);
            final endTime = DateTime.parse(endDate);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(20.0),
                  leading: Icon(Icons.calendar_today, color: Colors.blue),
                  title: Text(
                    event.name ?? 'Tanpa Nama',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            '${startTime.day} ${_monthToString(startTime.month)} ${startTime.year}, ${_formatTime(startTime)} - ${_formatTime(endTime)}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        '$title',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '$description - $location',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            if (id != null && roomId != null) {
                              context.read<DeleteBookingRoomBloc>().add(
                                  DeleteBookingRoom(id: id, roomid: roomId));
                            } else {}
                          },
                          child: Text(
                            'Cancel Booking',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    }
  }

  String _monthToString(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des'
    ];
    return months[month - 1];
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
