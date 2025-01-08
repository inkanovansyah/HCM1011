import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/leave/cardBody.dart';

class LeaveBos extends StatefulWidget {
  const LeaveBos({super.key});

  @override
  State<LeaveBos> createState() => _LeaveBosState();
}

class _LeaveBosState extends State<LeaveBos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor, // Mengatur warna biru gelap
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Leave Request Employe',
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous page
          },
        ),
      ),
      backgroundColor: Color(0xffEEF2FD),
      body: BodyCard(),
    );
  }
}
