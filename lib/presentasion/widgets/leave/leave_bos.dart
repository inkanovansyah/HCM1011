import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package

import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/bloc/bloc_request_bos/bos_request_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_approval_bos/approval_bos_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_decline_bos/decline_bos_bloc.dart';

class CardRequest extends StatefulWidget {
  const CardRequest({super.key});

  @override
  State<CardRequest> createState() => _BodyCardState();
}

class _BodyCardState extends State<CardRequest> {
  @override
  void initState() {
    // Memicu pengambilan data saat widget diinisialisasi
    Future.microtask(
      () => context.read<BosRequestBloc>().add(const GetListLeaveRequest()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApprovalBosBloc, ApprovalBosState>(
      listener: (context, state) {
        if (state is BosRequestLoaded) {
          context.read<BosRequestBloc>().add(GetListLeaveRequest());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Request approved successfully!')),
          );
        } else if (state is ApprovalBosError) {}
      },
      child: BlocBuilder<BosRequestBloc, BosRequestState>(
        builder: (context, state) {
          if (state is BosRequestLoading) {
            // Shimmer loading effect
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5, // Number of shimmer items to show
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.white, // Placeholder for icon
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 20,
                                        color: Colors
                                            .white, // Placeholder for name
                                      ),
                                      const SizedBox(height: 4),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 15,
                                            color: Colors
                                                .white, // Placeholder for date
                                          ),
                                          const SizedBox(height: 4),
                                          Container(
                                            width: 150,
                                            height: 15,
                                            color: Colors
                                                .white, // Placeholder for notes
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    color: Colors
                                        .white, // Placeholder for Approve button
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    color: Colors
                                        .white, // Placeholder for Decline button
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is BosRequestLoaded) {
            // Your existing code for loaded state
            if (state.listRequest?.list?.isEmpty ?? true) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    Image.asset(
                      'assets/images/no_leave.png',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 30),
                    Text(
                      'No leave requests found.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.listRequest?.list?.length,
                itemBuilder: (context, index) {
                  final requestData = state.listRequest?.list?[index];
                  final leave_id = requestData?.id ?? '';
                  final leave_name = requestData?.leaveName ?? '';
                  final leave_total = requestData?.leaveTotal ?? '';
                  final leave_status = requestData?.leaveStatus ?? '';
                  final full_name = requestData?.fullName ?? '';
                  final date_start = requestData?.dateStart != null
                      ? DateFormat("d MMM yyyy").format(requestData!.dateStart!)
                      : 'N/A';
                  final date_end = requestData?.dateEnd != null
                      ? DateFormat("d MMM yyyy").format(requestData!.dateEnd!)
                      : 'N/A';

                  final notes = requestData?.notes ?? '';

                  String statusIcon = '';
                  Color labelColor = Colors.transparent;
                  Color colorLabel = Colors.transparent;

                  // Assigning label and icon based on leave_status
                  if (leave_status == 'APPLY') {
                    statusIcon = 'assets/status/Permision.png';
                    labelColor = Color(0xffFFF4DE);
                    colorLabel = Color(0xffFFCC32);
                  } else if (leave_status == 'APPROVE') {
                    statusIcon = 'assets/status/Permision.png';
                    labelColor = Color(0xffE1FFF4);
                    colorLabel = Color(0xff66CEC1);
                  } else if (leave_status == 'DECLINE') {
                    statusIcon = 'assets/status/Permision.png';
                    labelColor = Color(0xffFFDCE0);
                    colorLabel = Color(0xffFF5064);
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                // Status Badge
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: colorLabel,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      '$leave_status',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: labelColor,
                                      ),
                                    ),
                                  ),
                                ),
                                // Row with image and information
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Status icon
                                    Image.asset(
                                      statusIcon,
                                      width: 50,
                                      height: 50,
                                    ),
                                    const SizedBox(width: 10),
                                    // Column with text information
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '$leave_name',
                                            style: openSensBoldDark.copyWith(
                                              fontSize: 16,
                                              color: darkColor,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.calendar_today,
                                                      size: 16,
                                                      color: darkColor),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    '$full_name',
                                                    style: openSensMediumDark
                                                        .copyWith(
                                                      fontSize: 13,
                                                      color: darkColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Icon(Icons.calendar_today,
                                                      size: 16,
                                                      color: darkColor),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    '$date_start - $date_end',
                                                    style: openSensMediumDark
                                                        .copyWith(
                                                      fontSize: 13,
                                                      color: darkColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    ' $leave_total Hari',
                                                    style: openSensMediumDark
                                                        .copyWith(
                                                      fontSize: 15,
                                                      color: darkColor,
                                                      fontWeight: FontWeight
                                                          .bold, // Menambahkan fontWeight untuk gaya bold
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Icon(
                                                      Icons.assignment_outlined,
                                                      size: 16,
                                                      color: darkColor),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    '$notes',
                                                    style: openSensMediumDark
                                                        .copyWith(
                                                      fontSize: 13,
                                                      color: darkColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Approve and Decline buttons
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.read<ApprovalBosBloc>().add(
                                          GetApprovalBos(idLeave: leave_id));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      'Approve',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.read<DeclineBosBloc>().add(
                                          DeclineBos(idDeclineLeave: leave_id));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      'Decline',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          } else if (state is BosRequestError) {
            return Text(state.message);
          } else {
            return Container(
              color: Color(0xffEEF2FD),
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'tidak terduga...',
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
