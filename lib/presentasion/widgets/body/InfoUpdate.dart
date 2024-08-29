import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/widgets/my-trining/card.dart';

class Trainings extends StatefulWidget {
  const Trainings({Key? key}) : super(key: key);
  @override
  State<Trainings> createState() => _infoTrainings();
}

class _infoTrainings extends State<Trainings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffEEF2FD),
      child: Column(
        children: [
          CardTrining(),
        ],
      ),
    );
  }
}
