import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hcm1011/presentasion/widgets/booking/booking_car.dart';
import 'package:hcm1011/presentasion/widgets/booking/booking_car_transaction.dart';
import 'package:hcm1011/presentasion/widgets/body/form_booking_car.dart';
import 'package:hcm1011/presentasion/bloc/bloc_transaksi_booking/transaksi_booking_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_booking_backapply/booking_backapply_bloc.dart';

class cardBookingCar extends StatefulWidget {
  const cardBookingCar({super.key});

  @override
  State<cardBookingCar> createState() => _cardBookingCarState();
}

class _cardBookingCarState extends State<cardBookingCar> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingBackapplyBloc, BookingBackapplyState>(
      listener: (context, state) {
        if (state is BookingBackapplyLoaded) {
          // Refresh the goal setting list after delete
          context.read<TransaksiBookingBloc>().add(const GetTransaksi());

          // Menampilkan dialog dengan ikon ceklis saat sukses
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Success'),
                content: Row(
                  children: [
                    const Icon(Icons.check_circle,
                        color: Colors.green, size: 40),
                    const SizedBox(width: 10),
                    const Text('Your booking is finished.'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Menutup dialog
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        } else if (state is BookingBackapplyError) {
          // Menampilkan dialog dengan ikon silang saat gagal
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: Row(
                  children: [
                    const Icon(Icons.error, color: Colors.red, size: 40),
                    const SizedBox(width: 10),
                    Text(state.message),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Menutup dialog
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xffEEF2FD),
        body: ListView(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    left:
                        16.0), // Ubah angka sesuai kebutuhan margin kanan Anda
                child: Text(
                  'Available Cars',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            CardBookingCar(),
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    left:
                        16.0), // Ubah angka sesuai kebutuhan margin kanan Anda
                child: Text(
                  'History\'s BOOKING',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(child: CardTransactionCar()), // Use Expanded here
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
        floatingActionButton: Stack(
          children: [
            Positioned(
              bottom: 20, // Jarak dari bawah layar
              right: 10, // Jarak dari kanan layar
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => bodyFromCar(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: 16, horizontal: 20), // Padding tombol
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8)), // Bentuk tombol (bordes melengkung)
                  backgroundColor: Color(0xffD0D9F3), // Warna latar belakang
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
