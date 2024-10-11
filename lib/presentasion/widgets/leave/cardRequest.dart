import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/bloc/bloc_leave/leave_bloc.dart';

class CardRequest extends StatefulWidget {
  const CardRequest({Key? key}) : super(key: key);

  @override
  State<CardRequest> createState() => _CardRequestState();
}

class _CardRequestState extends State<CardRequest> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<LeaveBloc>().add(const GetListLeave()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaveBloc, LeaveState>(
      builder: (context, state) {
        if (state is LeaveLoading) {
          return Container(
            color: Color.fromARGB(255, 245, 251, 255), // Background color
            height: 100,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LeaveLoaded) {
          final leaveList = state.leaveList?.list;

          if (leaveList == null || leaveList.isEmpty) {
            // Data list is empty
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Image.asset(
                    'assets/images/no_leave.png', // Add a path to your no data image
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
            // Sort the list by id in ascending order
            leaveList.sort((a, b) => (a['id'] ?? '').compareTo(b['id'] ?? ''));

            return SingleChildScrollView(
              child: Column(
                children: leaveList.map((leaveData) {
                  final leave_name = leaveData['leave_name'] ?? 'No Name';
                  final leave_status = leaveData['leave_status'] ?? 'No Status';
                  final date_start = leaveData['date_start'] ?? 'No Start Date';
                  final date_end = leaveData['date_end'] ?? 'No End Date';

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
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 30,
                                right: 10,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: labelColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    '$leave_status',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: colorLabel,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 14),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      statusIcon,
                                      width: 50,
                                      height: 50,
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '$leave_name',
                                          style: openSensBoldDark.copyWith(
                                            fontSize: 16,
                                            color: darkColor,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '$date_start - $date_end',
                                          style: openSensMediumDark.copyWith(
                                            fontSize: 13,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }
        } else if (state is LeaveError) {
          return Center(
            child: Text(state.messages),
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
    );
  }
}
