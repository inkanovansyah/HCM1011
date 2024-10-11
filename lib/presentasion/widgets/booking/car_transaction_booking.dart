import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/widgets/booking/booking_car_transaction.dart';

class bookingTransaksiCar extends StatefulWidget {
  const bookingTransaksiCar({super.key});

  @override
  State<bookingTransaksiCar> createState() => _bookingTransaksiCar();
}

class _bookingTransaksiCar extends State<bookingTransaksiCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF2FD),
      body: CardTransactionCar(),
    );
  }
}
