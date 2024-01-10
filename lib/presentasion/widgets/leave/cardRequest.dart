import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/bloc/bloc_leave/leave_bloc.dart';

class CardRequest extends StatefulWidget {
  const CardRequest({Key? key}) : super(key: key);

  @override
  State<CardRequest> createState() => _CardRequest();
}

class _CardRequest extends State<CardRequest> {
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
            color: Color.fromARGB(
                255, 245, 251, 255), // Tambahkan latar belakang putih di sini
            height: 100, // Tambahkan ketinggian di sini
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LeaveLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.leaveList?.list
                ?.length, // Tentukan jumlah item yang ingin ditampilkan
            itemBuilder: (context, index) {
              final leaveData = state.leaveList!.list![index];
              // final id = state.leaveList?.list?[index].id;
              final leave_name = leaveData['leave_name'] ?? 'No Name';
              final leave_status = leaveData['leave_status'] ?? 'No Name';
              final date_start = leaveData['date_start'] ?? 'No Start Date';
              final date_end = leaveData['date_end'] ?? 'No End Date';
              // Variables for icons and label colors based on leave_status
              // String statusLabel = '';
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
                      height: 90,
                      width: 360,
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
                                  statusIcon, // Ganti dengan path gambar yang sesuai
                                  width: 50,
                                  height: 50,
                                  // Atur ukuran gambar sesuai kebutuhan
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
            },
          );
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
    // Color labelColor;

    // // Set label color based on status
    // if (widget.status == 'Approved') {
    //   labelColor = Colors.green; // Green for Approved
    // } else if (widget.status == 'Pending') {
    //   labelColor = Colors.orange; // Orange for Pending
    // } else if (widget.status == 'Declined') {
    //   labelColor = Colors.red; // Red for Declined
    // } else {
    //   labelColor = Colors.black; // Default color if status is not recognized
    // }
    // return Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 10),
    //   child: Card(
    //     elevation: 4.0,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     child: InkWell(
    //       borderRadius: BorderRadius.circular(10),
    //       child: Container(
    //         height: 90,
    //         width: 360,
    //         decoration: BoxDecoration(
    //           color: whiteColor,
    //           borderRadius: BorderRadius.circular(10),
    //         ),
    //         child: Stack(
    //           children: [
    //             Positioned(
    //               top: 10, // Adjust the vertical position as needed
    //               right: 10, // Adjust the horizontal position as needed
    //               child: Container(
    //                 padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    //                 decoration: BoxDecoration(
    //                   color: labelColor, // You can change the background color
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //                 child: Text(
    //                   widget.topRightLabel, // Use the new label parameter
    //                   style: TextStyle(
    //                     fontSize: 12,
    //                     color: Colors.white, // Text color
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Row(
    //               children: [
    //                 SizedBox(
    //                   width: 5,
    //                 ),
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     SizedBox(
    //                       height: 10,
    //                     ),
    //                     Padding(
    //                       padding: EdgeInsets.only(
    //                           left: 10.0), // Atur padding kiri sesuai kebutuhan
    //                       child: Text(
    //                         widget.label_1,
    //                         style: openSensBoldDark.copyWith(
    //                           fontSize: 16,
    //                           color: darkColor,
    //                         ),
    //                         textAlign: TextAlign.left,
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 4,
    //                     ),
    //                     Padding(
    //                       padding: EdgeInsets.only(
    //                           left: 10.0), // Atur padding kiri sesuai kebutuhan
    //                       child: Text(
    //                         widget.label_2,
    //                         style: openSensMediumDark.copyWith(
    //                           fontSize: 13,
    //                         ),
    //                         textAlign: TextAlign.left,
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 4,
    //                     ),
    //                   ],
    //                 ),
    //                 SizedBox(
    //                   width: 10,
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
