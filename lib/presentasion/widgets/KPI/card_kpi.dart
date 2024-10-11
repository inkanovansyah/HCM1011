import 'package:flutter/material.dart';
import 'dart:convert'; // Needed for jsonDecode
import 'package:shimmer/shimmer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_goal_setting/goal_setting_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_delete_gs/delete_bloc.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/pages/form_goal_setting_edit.dart';
import 'package:hcm1011/presentasion/pages/form_kpi_edit.dart';

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
    return BlocListener<DeleteDataBloc, DeleteDataState>(
      listener: (context, state) {
        if (state is DeleteDataLoaded) {
          // Refresh the goal setting list after delete
          context.read<GoalSettingBloc>().add(const GoalSetting());
        }
      },
      child: BlocBuilder<GoalSettingBloc, GoalSettingState>(
        builder: (context, state) {
          if (state is GoalSettingLoading) {
            return Container(
              color: Color.fromARGB(255, 245, 251, 255),
              height: 100,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: ListView.builder(
                  itemCount: 5, // Simulate 5 placeholder items
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            width: 4.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else if (state is GoalSettingLoaded) {
            if (state.listGoal == null || state.listGoal!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/status/no_info.png'),
                    SizedBox(height: 6),
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
                  final salf_submit = state.listGoal?[index].goalSelfSubmit;
                  final id = state.listGoal?[index].id?.toString() ?? '';
                  final aproval_submit =
                      state.listGoal?[index].goalApprovalSubmit;
                  final questionValueMap =
                      question_value != null ? jsonDecode(question_value) : {};
                  final jobsDesc =
                      questionValueMap['jobs_desc'] ?? 'No description';
                  final target = questionValueMap['target'] ?? 'No description';
                  final value =
                      questionValueMap['satuan_target'] ?? 'No description';

                  return Container(
                    color: Color(0xffEEF2FD),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                              padding: const EdgeInsets.all(10.0),
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
                                    '$value',
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
                                              color: Colors.black),
                                          SizedBox(width: 5),
                                          Text(
                                            '$target  Target',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.pie_chart,
                                              color: Colors.black),
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
                                  if (salf_submit == "0")
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // This will print the value of id in the console
                                              Navigator.pushNamed(
                                                context,
                                                infoDetailFrom.route,
                                                arguments: EditFormPageArgument(
                                                    edit_id: id),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                              elevation: 0,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 12),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            child: const Text(
                                              'Edit',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (id != null) {
                                                context
                                                    .read<DeleteDataBloc>()
                                                    .add(DeleteGoalSettingEvent(
                                                        idAnswer: id));
                                              } else {
                                                // Handle case where id is null, maybe show a snackbar or an error message
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              elevation: 0,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 12),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            child: const Text(
                                              'Delete',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  else if (salf_submit == "1")
                                    if (aproval_submit == "0")
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: ElevatedButton(
                                                onPressed: null,
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.orange,
                                                  elevation: 0,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 24,
                                                      vertical: 12),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Waiting for approval',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  if (aproval_submit == "1")
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  infoDetailFromKpi.route,
                                                  arguments:
                                                      EditFormKPIPageArgument(
                                                          editkpi_id: id),
                                                );
                                                // Navigator.pushNamed(
                                                //   context,
                                                //   infoDetailFrom.route,
                                                //   arguments:
                                                //       EditFormPageArgument(
                                                //           edit_id: id),
                                                // );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.orange,
                                                elevation: 0,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24,
                                                        vertical: 12),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              child: const Text(
                                                'Edit KPI',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
      ),
    );
  }
}
