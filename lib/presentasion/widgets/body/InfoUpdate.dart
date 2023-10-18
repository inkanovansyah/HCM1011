import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/widgets/info&update/CradInfoUpdate.dart';

class InfoUpdate extends StatefulWidget {
  const InfoUpdate({super.key});

  @override
  State<InfoUpdate> createState() => _infoUpdate();
}

class _infoUpdate extends State<InfoUpdate> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CradInfoUpdate(),
      ],
    );
  }
}
