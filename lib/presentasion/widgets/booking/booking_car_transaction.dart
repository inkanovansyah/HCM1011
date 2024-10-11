import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hcm1011/presentasion/bloc/bloc_transaksi_booking/transaksi_booking_bloc.dart';
import 'package:hcm1011/data/model/listTransaksiBooking.dart';
import 'package:hcm1011/presentasion/bloc/bloc_booking_backapply/booking_backapply_bloc.dart';

class CardTransactionCar extends StatefulWidget {
  const CardTransactionCar({super.key});

  @override
  State<CardTransactionCar> createState() => _CardBookingCar();
}

class _CardBookingCar extends State<CardTransactionCar> {
  DateTime _selectedDay = DateTime.now();
  List<Datum> _bookings = [];
  String? _sharedEmployeeId; // To store employeeId from SharedPreferences

  @override
  void initState() {
    super.initState();
    _loadEmployeeId(); // Load employee ID from SharedPreferences
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
      context.read<TransaksiBookingBloc>().add(GetTransaksi());
    } else {
      setState(() {
        _bookings = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingBackapplyBloc, BookingBackapplyState>(
      listener: (context, state) {
        if (state is TransaksiBookingLoaded) {
          context.read<TransaksiBookingBloc>().add(const GetTransaksi());
        }
      },
      child: BlocBuilder<TransaksiBookingBloc, TransaksiBookingState>(
        builder: (context, state) {
          if (state is TransaksiBookingLoading) {
            return Center(
              child: CircularProgressIndicator(),
            ); // Loading state
          } else if (state is TransaksiBookingLoaded) {
            DateTime today = _stripTime(DateTime.now());

            if (_selectedDay.isBefore(today)) {
              _bookings = []; // Clear bookings for past dates
            } else {
              _bookings = state.transakiList?.where((booking) {
                    final startDate = _stripTime(DateTime(
                      booking.bookingStart!.year,
                      booking.bookingStart!.month,
                      booking.bookingStart!.day,
                    ));
                    return startDate == _selectedDay && booking.isActive == "1";
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
                _buildEventsList(),
              ],
            );
          } else if (state is BookingError) {
            return Text(state.message);
          } else {
            return Container(
              color: Color(0xffEEF2FD),
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'tidak terduga...',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildEventsList() {
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
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _bookings.length,
        itemBuilder: (context, index) {
          final bookingData = _bookings[index];
          final namemobil = bookingData.description;
          final description = bookingData.deskripsi;
          final namaPenguna = bookingData.namaPengguna;
          final bookingStart = bookingData.bookingStart;
          final bookingEnd = bookingData.bookingEnd;
          final transmisi = bookingData.transmisi;
          final bahanBakar = bookingData.bahanBakar;
          final jumlahKursi = bookingData.jenisChar;
          final employeeId = bookingData.employeeId;
          final id = bookingData.id;

          final String startDate = bookingStart != null
              ? DateFormat('dd MMM yyyy ,HH:mm').format(bookingStart)
              : 'Unknown';
          final String endDate = bookingEnd != null
              ? DateFormat('HH:mm').format(bookingEnd)
              : 'Unknown';

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  // Add onTap functionality here if needed
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.directions_car,
                                color: Colors.grey, size: 20),
                            const SizedBox(width: 6),
                            Text(
                              namemobil ?? 'Unknown',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '$startDate - $endDate',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          namaPenguna ?? 'Unknown',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description ?? 'No Description',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.settings,
                                    color: Colors.grey, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  transmisi ?? 'Unknown',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.local_gas_station,
                                    color: Colors.grey, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  bahanBakar ?? 'Unknown',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.person,
                                    color: Colors.grey, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  jumlahKursi ?? 'Unknown',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        // Show the "Cancel" button only if employeeId matches
                        if (_sharedEmployeeId == employeeId)
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (id != null) {
                                  context
                                      .read<BookingBackapplyBloc>()
                                      .add(BookingBackEvent(idbooking: id));
                                } else {
                                  // Handle case where id is null, maybe show a snackbar or an error message
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red, // Button color
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14.0),
                              ),
                              child: const Text(
                                'Cancel Booking',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
