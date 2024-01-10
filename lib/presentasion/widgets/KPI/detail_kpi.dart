import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_kpi/kpi_bloc.dart';

class KpiDetail extends StatefulWidget {
  const KpiDetail({super.key});

  @override
  State<KpiDetail> createState() => _nameState();
}

class _nameState extends State<KpiDetail> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<KpiBloc>().add(const GetListKpi()),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(),
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ClipRRect(
                    child: Container(
                      height: MediaQuery.of(context).size.height *
                          0.30, // 15% of screen height
                      width: MediaQuery.of(context).size.width,
                      color:
                          darkdarkBlueColor, // Background color (darkdarkBlueColor)
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.00,
            left: 20,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: 350,
                height: 320,
                padding: EdgeInsets.all(20),
                child: BlocBuilder<KpiBloc, KpiState>(
                  builder: (context, state) {
                    if (state is KpiLoading) {
                      return Container(
                        color: Color.fromARGB(255, 245, 251,
                            255), // Tambahkan latar belakang putih di sini
                        height: 100, // Tambahkan ketinggian di sini
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is KpiLoaded) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.dataKpi?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final kpiDatum = state.dataKpi!.data![index];

                          if (kpiDatum.isActive == '1') {
                            final name = kpiDatum.name ?? 'No_Name';

                            final id = kpiDatum.id;

                            final progressValue = kpiDatum
                                        .progress?.isNotEmpty ==
                                    true
                                ? kpiDatum.progress![0].progress.toString()
                                : '0'; // Mengonversi nilai int ke dalam String
                            String progresdata = '';
                            Color progressColor = Colors.transparent;
                            switch (progressValue) {
                              case '1':
                                progressColor = Colors.red;
                                progresdata = 'Belum Ada Goal Setting';
                                break;
                              case '15':
                                progressColor = Colors.orange;
                                progresdata = 'KPI belum lengkap';
                                break;
                              case '25':
                                progressColor = Colors.lightGreen;
                                progresdata = 'KPI sudah 100%';
                                break;
                              case '50':
                                progressColor = Colors.green;
                                progresdata = 'Actual Achievement';
                                break;
                              case '75':
                                progressColor = Colors.lightGreen;
                                progresdata = 'Atasan Appraisal';
                                break;
                              case '100':
                                progressColor = Colors.lightGreen;
                                progresdata = 'Atasan Appraisal';
                                break;
                              default:
                                progressColor = Colors
                                    .grey; // Warna default jika nilai tidak cocok
                                break;
                            }

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text(
                                //   '$start_date - $end_date', // Ganti dengan deskripsi sesuai kebutuhan
                                //   style: TextStyle(
                                //     fontSize: 16,
                                //   ),
                                //   textAlign: TextAlign.center,
                                // ),

                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Atur posisi ke kiri
                                    children: [
                                      Text(
                                        '$id',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 120,
                                      ), // Jarak antara judul dan deskripsi
                                      Text(
                                        '$progressValue %', // Ganti dengan deskripsi sesuai kebutuhan
                                        style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              progressColor, // Menggunakan warna yang sudah ditentukan sebelumnya
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '$progresdata',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      LinearProgressIndicator(
                                        value: double.parse(progressValue) /
                                            100, // Sesuaikan dengan nilai progress
                                        backgroundColor: Colors.grey[300],
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                progressColor),
                                        minHeight:
                                            8, // Sesuaikan dengan ukuran yang diinginkan
                                      ),
                                      SizedBox(
                                          height:
                                              10), // Jarak antara judul dan deskripsi
                                      Text(
                                        '$name',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                            // Lakukan sesuatu dengan data yang hanya memiliki isActive bernilai 1 di sini
                            // Contohnya, tampilkan data ini di dalam Widget atau lakukan operasi lainnya
                          } else {
                            return Container();
                          }
                          // Return widget based on your requirements
                        },
                      );
                    } else if (state is KpiNoData) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('No data available'),
                      );
                    } else if (state is KpiError) {
                      return Center(
                        child: Text(state.messages),
                      );
                    } else {
                      return Text('Keadaan yang tidak terduga');
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
