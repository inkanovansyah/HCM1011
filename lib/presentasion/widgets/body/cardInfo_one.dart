import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_kpi/kpi_bloc.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/data/model/kpi_detail.dart';

class CardInfoOne extends StatefulWidget {
  CardInfoOne();

  @override
  State<CardInfoOne> createState() => _CardInfoOneState();
}

class _CardInfoOneState extends State<CardInfoOne> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<KpiBloc>().add(const GetListKpi()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -30), // Geser ke atas sebanyak 30 piksel
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.13,
        width: MediaQuery.of(context).size.width * 0.47, // Lebar disesuaikan
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0), // Padding dikurangi
          child: Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: darkdarkBlueColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1.0,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/images/Asset_2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  BlocBuilder<KpiBloc, KpiState>(
                    builder: (context, state) {
                      if (state is KpiLoading) {
                        return Center(
                          child: Container(),
                        );
                      } else if (state is KpiLoaded) {
                        final kpiDatum = state.dataKpi?.data?.firstWhere(
                          (kpi) => kpi.isActive == '1',
                          orElse: () => Datum(
                              id: '0',
                              name: 'No Data',
                              isActive: '0',
                              progress: [Progress(progress: 0)]),
                        );

                        if (kpiDatum != null && kpiDatum.isActive == '1') {
                          final progressValue =
                              kpiDatum.progress?.isNotEmpty == true
                                  ? kpiDatum.progress![0].progress.toString()
                                  : '0';

                          String progresdata = '';
                          Color progressColor = Colors.transparent;
                          switch (progressValue) {
                            case '1':
                              progressColor = Colors.red;
                              progresdata = 'No Goal Setting Yet';
                              break;
                            case '15':
                              progressColor = Colors.orange;
                              progresdata = 'KPI is not complete';
                              break;
                            case '25':
                              progressColor = Colors.lightGreen;
                              progresdata = 'KPI Waitting Approval';
                              break;
                            case '50':
                              progressColor = Colors.green;
                              progresdata = 'Actual Achievement';
                              break;
                            case '75':
                              progressColor = Colors.lightGreen;
                              progresdata = 'Appraisal Supervisor';
                              break;
                            case '100':
                              progressColor = Colors.lightGreen;
                              progresdata = 'Finished';
                              break;
                            default:
                              progressColor =
                                  Colors.grey; // Warna default jika tidak cocok
                              break;
                          }

                          return Stack(
                            children: [
                              Positioned(
                                bottom: 30,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: LinearProgressIndicator(
                                    value: double.parse(progressValue) / 100,
                                    backgroundColor: Colors.grey[200],
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        progressColor),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    progresdata,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '$progressValue %',
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Align(
                            alignment: Alignment.center,
                            child: Text(
                              'No Active KPI',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }
                      } else if (state is KpiError) {
                        return Center(
                          child: Text(
                            state.messages,
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      } else {
                        return Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Unexpected State',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
