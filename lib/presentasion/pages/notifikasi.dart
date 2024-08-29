import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

import 'package:hcm1011/presentasion/widgets/body/body_notifikasi.dart';

class PayRoll extends StatefulWidget {
  const PayRoll({
    Key? key,
  }) : super(key: key);

  @override
  State<PayRoll> createState() => _payrollState();
}

class _payrollState extends State<PayRoll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Notification',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false, // Menghilangkan tombol back
      ),
      backgroundColor: Color(0xffEEF2FD),
      body: notification(),
    );
  }
}
