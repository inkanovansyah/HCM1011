import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/KPI/list-kpi.dart';
import 'package:hcm1011/presentasion/bloc/bloc_submit_gs/submit_gs_bloc.dart';
import 'package:hcm1011/presentasion/pages/form_goal_setting.dart';
import 'package:hcm1011/presentasion/bloc/bloc_submit_aproroval_gs/submit_aproroval_gs_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_goal_setting/goal_setting_bloc.dart';

class ListKpi extends StatefulWidget {
  const ListKpi({super.key});

  @override
  State<ListKpi> createState() => _ListKpi();
}

class Datum {
  final int? goalSelfSubmit;
  final String? weightage;

  Datum({this.goalSelfSubmit, this.weightage});
}

class _ListKpi extends State<ListKpi> {
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          'Goal Setting List',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: const Color(0xffEEF2FD),
      body: MultiBlocListener(
        listeners: [
          BlocListener<SubmitAprovalGsBloc, SubmitAprorovalGsState>(
            listener: (context, state) {
              if (state is SubmitAprorovalGsLoaded) {
                // Trigger refresh after submission
                context.read<GoalSettingBloc>().add(const GoalSetting());
              }
            },
          ),
          BlocListener<SubmitGsBloc, SubmitGsState>(
            listener: (context, state) {
              if (state is SubmitGsLoaded) {
                // Trigger refresh after submission
                context.read<GoalSettingBloc>().add(const GoalSetting());
              }
            },
          ),
          BlocListener<SubmitAprovalGsBloc, SubmitAprorovalGsState>(
            listener: (context, state) {
              if (state is SubmitAprorovalGsLoaded) {
                // Trigger refresh after submission
                context.read<GoalSettingBloc>().add(const GoalSetting());
              }
            },
          ),
        ],
        child: CardKpi(),
      ),
      floatingActionButton: BlocBuilder<GoalSettingBloc, GoalSettingState>(
        builder: (context, state) {
          if (state is GoalSettingLoading) {
            return Container(
              color: const Color.fromARGB(255, 245, 251, 255),
              height: 100,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is GoalSettingLoaded) {
            if (state.listGoal == null || state.listGoal!.isEmpty) {
              return Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0), // Add horizontal padding
                  child: Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormGoalSetting(),
                          ),
                        );
                      },
                      label: const Text(
                        'Add Goal Setting',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF202449),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        minimumSize: const Size(320, 50),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              final firstGoalSelfSubmit = state.listGoal!.isNotEmpty
                  ? state.listGoal![0].goalSelfSubmit
                  : null;
              final aprovalGolasetting = state.listGoal!.isNotEmpty
                  ? state.listGoal![0].goalApprovalSubmit
                  : null;

              final totalWeightage = state.listGoal!.fold<int>(
                0,
                (sum, goal) {
                  final weightageString = goal.weightage ?? '0';
                  final weightage = int.tryParse(weightageString) ?? 0;
                  return sum + weightage;
                },
              );

              Widget buildButton({
                required String label,
                required IconData icon,
                required Color color,
                VoidCallback? onPressed,
              }) {
                return Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onPressed,
                    label: Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    icon: Icon(
                      icon,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      minimumSize: const Size(320, 50),
                    ),
                  ),
                );
              }

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
                        buildButton(
                          label: 'Add Goal Setting',
                          icon: Icons.add,
                          color: const Color(0xFF202449),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormGoalSetting()),
                            );
                          },
                        ),
                      if (totalWeightage == 100 && firstGoalSelfSubmit == "0")
                        buildButton(
                          label: 'Ask For Approval',
                          icon: Icons.send,
                          color: const Color(0xFF202449),
                          onPressed: () {
                            context.read<SubmitGsBloc>().add(SubmitGsEvent());
                          },
                        ),
                      if (firstGoalSelfSubmit == "1" &&
                          aprovalGolasetting == "0")
                        buildButton(
                          label: 'Waiting for Approval',
                          icon: Icons.hourglass_empty,
                          color: const Color(0xFF202449),
                          onPressed: null,
                        ),
                      if (aprovalGolasetting == "1")
                        buildButton(
                          label: 'Kirim Ke Atasan',
                          icon: Icons.hourglass_empty,
                          color: Colors.orange,
                          onPressed: () {
                            context
                                .read<SubmitAprovalGsBloc>()
                                .add(SubmitAprorovalEvent());
                          },
                        ),
                    ],
                  ),
                ),
              );
            }
          } else {
            return const Center(
              child: Text('belum ada action'),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
