import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/KPI/list-kpi.dart';
import 'package:hcm1011/presentasion/pages/form_goal_setting.dart';

class ListKpi extends StatefulWidget {
  const ListKpi({super.key});

  @override
  State<ListKpi> createState() => _ListKpi();
}

class _ListKpi extends State<ListKpi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'KPI List',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous page
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add,
                color: Colors.white, size: 30), // Atur ukuran ikon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FormGoalSetting()), // Ganti "HalamanBaru" dengan nama halaman baru yang ingin Anda tuju
              );
            },
          ),
        ],
      ),
      backgroundColor: Color(0xffEEF2FD),
      body: CardKpi(),
    );
  }
}
