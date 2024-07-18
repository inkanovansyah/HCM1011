import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/KPI/list-kpi.dart';
import 'package:hcm1011/presentasion/pages/form_goal_setting.dart';

import 'package:hcm1011/presentasion/bloc/bloc_goal_setting/goal_setting_bloc.dart';

class ListKpi extends StatefulWidget {
  const ListKpi({super.key});

  @override
  State<ListKpi> createState() => _ListKpi();
}

class _ListKpi extends State<ListKpi> {
  bool isButtonEnabled = false; // Change this based on your logic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Goal Setting List',
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
      ),
      backgroundColor: Color(0xffEEF2FD),
      body: CardKpi(),
      floatingActionButton: BlocBuilder<GoalSettingBloc, GoalSettingState>(
        builder: (context, state) {
          if (state is GoalSettingLoading) {
            return Container(
              color: Color.fromARGB(255, 245, 251, 255),
              height: 100,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is GoalSettingLoaded) {
            if (state.listGoal == null || state.listGoal == null) {
              return Center(
                child: Text('goal submit approval 0'),
              );
            } else {
              // Menghitung total weightage
              final totalWeightage = state.listGoal!.fold<int>(0, (sum, goal) {
                final weightageString = goal.weightage ?? '0';
                final weightage = int.tryParse(weightageString) ?? 0;
                return sum + weightage;
              });

              return Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (totalWeightage < 100)
                        Expanded(
                          child: TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FormGoalSetting()),
                              );
                            },
                            label: Text(
                              'Tambah Goal Setting',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF202449),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                              minimumSize: Size(
                                  320, 50), // Sesuaikan tinggi sesuai kebutuhan
                            ),
                          ),
                        ),
                      if (totalWeightage == 100)
                        Expanded(
                          child: TextButton.icon(
                            onPressed: () {
                              // Aksi untuk tombol Kirim Keatasan
                            },
                            label: Text(
                              'Minta Persetujuan',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            icon: Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF202449),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                              minimumSize: Size(
                                  320, 50), // Sesuaikan tinggi sesuai kebutuhan
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }
          } else {
            return Center(
              child: Text('belum ada action'),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
