import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/bloc/bloc_balance/balance_bloc.dart';

class LeaveW extends StatefulWidget {
  @override
  State<LeaveW> createState() => _LeaveWState();
}

class _LeaveWState extends State<LeaveW> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<BalanceBloc>().add(const GetBalance()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalanceBloc, BalanceState>(
      builder: (context, state) {
        if (state is BalanceLoading) {
          return Container(
            color: Color.fromARGB(255, 245, 251, 255), // Warna latar belakang
            height: 130,
            child: Center(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          );
        } else if (state is BalanceLoaded) {
          // Gunakan data ModalSaldo
          final jatah = state.data?.jatah ?? 0;
          final sisa = state.data?.sisa ?? 0;

          return Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: 130, // Sesuaikan dengan kebutuhan
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF1BEFC7),
                      Color(0xFFF993E5),
                      Color(0xFFFFF1CA),
                      Color(0xFF62F4F4),
                    ], // Warna sesuai kebutuhan
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 120.0,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Image.asset(
                                'assets/images/petir.png',
                                fit: BoxFit.cover,
                                width: 54, // Sesuaikan lebar
                                height: 80, // Sesuaikan tinggi
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '$jatah',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Days',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Text(
                                        'Remaining Leaves | ',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        '$sisa Days Used',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 14.0),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is BalanceError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
