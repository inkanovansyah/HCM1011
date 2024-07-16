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
      floatingActionButton: Container(
        height:
            60, // Lebih tinggi dari tombol untuk memberikan ruang untuk latar belakang
        decoration: BoxDecoration(
          color: Colors.white, // Warna latar belakang putih
          boxShadow: [
            BoxShadow(
              color: Colors.black26, // Warna bayangan
              blurRadius: 5, // Radius blur bayangan
              offset: Offset(0, 2), // Posisi bayangan
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Jarak kiri dan kanan
          child: BlocBuilder<GoalSettingBloc, GoalSettingState>(
              builder: (context, state) {
            if (state is GoalSettingLoading) {
              return Container(
                color: Color.fromARGB(255, 245, 251,
                    255), // Tambahkan latar belakang putih di sini
                height: 100, // Tambahkan ketinggian di sini
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is GoalSettingLoaded) {
              if (state.listGoal == null || state.listGoal != null) {
                return Center();
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 180,
                      height: 40,
                      child: TextButton.icon(
                        onPressed: isButtonEnabled
                            ? () {
                                // Aksi untuk tombol pertama
                              }
                            : null,
                        label: Text(
                          'Buat KPI',
                          style: TextStyle(
                            color: isButtonEnabled
                                ? Colors.white
                                : Color(0xFF202449),
                          ),
                        ),
                        icon: Icon(
                          Icons.send,
                          color: isButtonEnabled
                              ? Colors.white
                              : Color(0xFF202449),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: isButtonEnabled
                              ? Color(0xFF202449)
                              : Color(0xFFF6F6F6),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      height: 40,
                      child: TextButton.icon(
                        onPressed: isButtonEnabled
                            ? () {
                                // Aksi untuk tombol kedua
                              }
                            : null,
                        label: Text(
                          'Kirim Keataasaan',
                          style: TextStyle(
                            color: isButtonEnabled
                                ? Colors.white
                                : Color(0xFF202449),
                          ),
                        ),
                        icon: Icon(
                          Icons.send,
                          color: isButtonEnabled
                              ? Colors.white
                              : Color(0xFF202449),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: isButtonEnabled
                              ? Color(0xFF202449)
                              : Color(0xFFF6F6F6),
                        ),
                      ),
                    ),
                  ],
                );
              }
            } else {
              return Container();
            }
          }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
