import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/widgets/my-trining/cardcardschedule.dart';

class schadule extends StatefulWidget {
  const schadule({Key? key}) : super(key: key);
  @override
  State<schadule> createState() => _infoTrainings();
}

class _infoTrainings extends State<schadule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffEEF2FD),
      child: Column(
        children: [
          CardSchedule(),
        ],
      ),
    );
  }
}
