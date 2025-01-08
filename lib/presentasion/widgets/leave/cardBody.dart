import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/widgets/leave/leave_bos.dart';
import 'package:hcm1011/presentasion/bloc/bloc_approval_bos/approval_bos_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_request_bos/bos_request_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_decline_bos/decline_bos_bloc.dart';

class BodyCard extends StatefulWidget {
  const BodyCard({super.key});

  @override
  State<BodyCard> createState() => _nameState();
}

class _nameState extends State<BodyCard> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ApprovalBosBloc, ApprovalBosState>(
          listener: (context, state) {
            if (state is ApprovalBosLoaded) {
              // Trigger refresh after approval
              context.read<BosRequestBloc>().add(const GetListLeaveRequest());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Request approved successfully!')),
              );
            }
          },
        ),
        BlocListener<DeclineBosBloc, DeclineBosState>(
          listener: (context, state) {
            if (state is DeclineBosLoaded) {
              // Trigger refresh after decline
              context.read<BosRequestBloc>().add(const GetListLeaveRequest());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Request declined successfully!')),
              );
            } else if (state is DeclineBosError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to decline request.')),
              );
            }
          },
        ),
      ],
      child: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 10),
            CardRequest(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
