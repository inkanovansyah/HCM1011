import 'package:flutter/material.dart';
import 'dart:convert'; // Needed for jsonDecode
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_goal_setting/goal_setting_bloc.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class CardKPI extends StatefulWidget {
  const CardKPI({super.key});

  @override
  State<CardKPI> createState() => _CardKPI();
}

class _CardKPI extends State<CardKPI> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<GoalSettingBloc>().add(const GoalSetting()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalSettingBloc, GoalSettingState>(
      builder: (context, state) {
        if (state is GoalSettingLoading) {
          return Container(
            color: Color.fromARGB(
                255, 245, 251, 255), // Tambahkan latar belakang putih di sini
            height: 100, // Tambahkan ketinggian di sini
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is GoalSettingLoaded) {
          if (state.listGoal == null || state.listGoal!.isEmpty) {
            // Display an image or a message indicating no data
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                      'assets/status/no_info.png'), // Replace with your image asset
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'No data available',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.listGoal!.length,
              itemBuilder: (context, index) {
                final weightage = state.listGoal?[index].weightage;
                final question_value = state.listGoal?[index].questionValue;
                final submit = state.listGoal?[index].selfValue;
                final appraisal = state.listGoal?[index].selfValue;
                final is_delete = state.listGoal?[index].isDelete;
                final questionValueMap =
                    question_value != null ? jsonDecode(question_value) : {};
                final jobsDesc = questionValueMap['jobs_desc'] ??
                    'No description'; // Default to 'No description' if jobs_desc is not found
                final SatuanTarget =
                    questionValueMap['satuan_target'] ?? 'No description';
                final Target = questionValueMap['target'] ?? 'No description';
                // Default to 'No description' if jobs_desc is not found
                return Container(
                  color: Color(0xffEEF2FD),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                              width: 4.0,
                            ),
                          ),
                          child: Padding(
                            // Padding ditambahkan di sini
                            padding: const EdgeInsets.all(
                                10.0), // Memberikan margin sebesar 2 piksel di semua sisi
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  '$jobsDesc',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Satuan',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '$SatuanTarget',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.my_location,
                                            color: Colors
                                                .black), // Use available icon
                                        SizedBox(width: 5),
                                        Text(
                                          '$Target Target',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.pie_chart,
                                            color: Colors
                                                .black), // Use available icon
                                        SizedBox(width: 5),
                                        Text(
                                          '$weightage % Bobot',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.green,
                                          elevation:
                                              0, // Menghilangkan bayangan
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24, vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        child: Text(
                                          'Edit',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            20), // Memberikan jarak 20 piksel antara tombol
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.red,
                                          elevation:
                                              0, // Menghilangkan bayangan
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24, vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        } else if (state is GoalSettingError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Container(
            color: Color(0xffEEF2FD),
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Text(
                  'data kosong...',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
