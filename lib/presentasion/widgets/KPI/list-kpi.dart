import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hcm1011/presentasion/widgets/KPI/card_kpi.dart';
import 'package:hcm1011/presentasion/bloc/bloc_submit_gs/submit_gs_bloc.dart';

import 'package:hcm1011/presentasion/bloc/bloc_submit_aproroval_gs/submit_aproroval_gs_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_goal_setting/goal_setting_bloc.dart';

class CardListKpi extends StatefulWidget {
  const CardListKpi({super.key});

  @override
  State<CardListKpi> createState() => _CardKpi();
}

class _CardKpi extends State<CardListKpi> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
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
      child: Container(
        color: Color(0xffEEF2FD),
        padding: EdgeInsets.only(bottom: 20),
        child: CardKPI(),
      ),
    );
    // return Container(
    //   color: Color(0xffEEF2FD),
    //   padding: EdgeInsets.only(bottom: 40),
    //   child: CardKPI(),
    // );
  }
}
