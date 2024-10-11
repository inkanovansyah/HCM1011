import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/bloc/bloc_kpi/kpi_bloc.dart';
import 'package:hcm1011/presentasion/pages/kpi-list.dart';

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
            right: 20,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
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
                          // print(response.body);
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
                                progresdata = 'Finished KPI';
                                break;
                              default:
                                progressColor = Colors
                                    .grey; // Warna default jika nilai tidak cocok
                                break;
                            }

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                                        height: 30,
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
                                      SizedBox(
                                          height:
                                              20), // Jarak antara teks dan tombol
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: progressValue == '75' ||
                                                  progressValue == '100'
                                              ? null // Disable the button when progressValue is '75' or '100'
                                              : () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ListKpi(),
                                                    ),
                                                  );
                                                },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 9.0,
                                                horizontal: 20.0),
                                            child: Text(
                                              progressValue == '100'
                                                  ? 'KPI Done' // Text when progressValue is '100'
                                                  : (progressValue == '75'
                                                      ? 'Menunggu Persetujuan'
                                                      : 'View KPI'),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: progressValue ==
                                                    '100'
                                                ? Colors
                                                    .grey // Color when progressValue is '100'
                                                : (progressValue == '75'
                                                    ? Colors.grey
                                                    : Color(0xFF202449)),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            elevation: 0,
                                            minimumSize: Size(320,
                                                50), // Adjust height as needed
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              20), // Jarak antara teks dan tombol
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Instruction',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Form Penilaian Kinerja ini terdiri dari 1 bagian:',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Bagian A: Individual Key Performance Indicators (KPI) penyelesaian dari penilaian kinerja.',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Evaluasi yang dilakukan oleh Atasan harus objektif dan berdasarkan kinerja aktual serta perilaku kerja yang diamati. Mendiskusikan hasil evaluasi harus dilakukan untuk mengetahui umpan balik atas pencapaian kinerja dengan Karyawan.',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Karyawan dan Atasan akan menandatangani dan memberikan komentar pada halaman 2 untuk menyatakan',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                            // Lakukan sesuatu dengan data yang hanya memiliki isActive bernilai 1 di sini
                            // Contohnya, tampilkan data ini di dalam Widget atau lakukan operasi lainnya
                          } else {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                      'assets/status/no_info.png'), // Replace with your image asset
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'No Active KPI',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
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
