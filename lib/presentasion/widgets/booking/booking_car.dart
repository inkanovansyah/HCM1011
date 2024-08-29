import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hcm1011/presentasion/bloc/bloc_booking_list/booking_list_bloc.dart';

class CardBookingCar extends StatefulWidget {
  const CardBookingCar({Key? key}) : super(key: key);

  @override
  State<CardBookingCar> createState() => _CardBookingCarRequest();
}

class _CardBookingCarRequest extends State<CardBookingCar> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<BookingListBloc>().add(const GetBookingList()),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingListBloc, BookingListState>(
      builder: (context, state) {
        if (state is BookingListLoading) {
          return Container(
            color: Color.fromARGB(
                255, 245, 251, 255), // Tambahkan latar belakang putih di sini
            height: 100, // Tambahkan ketinggian di sini
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is BookingListLoaded) {
          if (state.bookingList?.isEmpty ?? true) {
            // Data list is empty
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'assets/images/no_leave.png', // Add a path to your no data image
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'No leave requests found.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.bookingList
                  ?.length, // Tentukan jumlah item yang ingin ditampilkan
              itemBuilder: (context, index) {
                final bookingData = state.bookingList![index];
                final bookingName = bookingData.description;
                final description = bookingData.deskripsi;
                final bookingStatus = bookingData.isActive;
                final transmisi = bookingData.transmisi;
                final bahanBakar = bookingData.bahanBakar;
                final jumlahKursi = bookingData.jenisChar;

                String statusLabel;
                Color statusColor;

                if (bookingStatus == '0') {
                  statusLabel = "Available";
                  statusColor = Colors.green;
                } else if (bookingStatus == '1') {
                  statusLabel = "Booked";
                  statusColor = Colors.red;
                } else {
                  statusLabel = "Unknown";
                  statusColor = Colors.grey;
                }

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.directions_car,
                                      color: Colors.grey, size: 20),
                                  SizedBox(width: 4),
                                  Text(
                                    '$bookingName',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                '$description',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.settings,
                                          color: Colors.grey, size: 16),
                                      SizedBox(width: 4),
                                      Text(
                                        '$transmisi',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.local_gas_station,
                                          color: Colors.grey, size: 16),
                                      SizedBox(width: 4),
                                      Text(
                                        '$bahanBakar',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.person,
                                          color: Colors.grey, size: 16),
                                      SizedBox(width: 4),
                                      Text(
                                        '$jumlahKursi',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // line indicator in green
                                ],
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
        } else if (state is BookingListError) {
          return Center(
            child: Text(state.message),
          );
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
    );
  }
}
