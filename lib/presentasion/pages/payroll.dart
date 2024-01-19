import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:hcm1011/presentasion/bloc/bloc_payroll/payroll_bloc.dart';

class PayRoll extends StatefulWidget {
  const PayRoll({super.key});

  @override
  State<PayRoll> createState() => _payrollState();
}

class _payrollState extends State<PayRoll> {
  int _selectedYear = DateTime.now().year;
  int _selectedMonth = DateTime.now().month;
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  List<String> _months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];
  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    Future.microtask(
      () => context.read<PayrollBloc>().add(const GetList()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Salary',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false, // Menghilangkan tombol back
      ),
      backgroundColor: Color(0xffEEF2FD),
      body: SafeArea(
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
                            0.20, // 15% of screen height
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
                  width: 350,
                  height: 570,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10), // Jarak antara judul dan deskripsi
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            DropdownButton<int>(
                              value: _selectedYear,
                              onChanged: (int? newValue) {
                                setState(() {
                                  _selectedYear = newValue!;
                                });
                              },
                              items: List.generate(10, (index) {
                                return DropdownMenuItem<int>(
                                  value: DateTime.now().year - index,
                                  child: Text('${DateTime.now().year - index}'),
                                );
                              }),
                            ),
                            SizedBox(width: 10),
                            DropdownButton<int>(
                              value: _selectedMonth,
                              onChanged: (int? newValue) {
                                setState(() {
                                  _selectedMonth = newValue!;
                                });
                              },
                              items: _months.map(
                                (String month) {
                                  return DropdownMenuItem<int>(
                                    value: _months.indexOf(month) + 1,
                                    child: Text(month),
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        child: BlocBuilder<PayrollBloc, PayrollState>(
                          builder: (context, state) {
                            if (state is PayrollLoading) {
                              return Container(
                                color: Color.fromARGB(255, 245, 251,
                                    255), // Tambahkan latar belakang putih di sini
                                height: 100, // Tambahkan ketinggian di sini
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else if (state is PayrollInfoLoaded) {
                              final detailPayroll = state.dataPayroll;
                              final totalPokok = double.tryParse(
                                      detailPayroll?.totalPenghasilan ?? '') ??
                                  0.0;

                              return SfCircularChart(
                                series: <CircularSeries>[
                                  DoughnutSeries<_ChartData, String>(
                                    dataSource: [
                                      _ChartData('Earnings', totalPokok),
                                      _ChartData(
                                          'Deductions', 100 - totalPokok),
                                    ],
                                    xValueMapper: (_ChartData data, _) =>
                                        data.x,
                                    yValueMapper: (_ChartData data, _) =>
                                        data.y,
                                    // Explode the segments on tap
                                    explode: true,
                                    explodeIndex: 1,
                                  )
                                ],
                              );
                            } else if (state is PayrollInfoNoData) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 20.0),
                                child: Text('No data available'),
                              );
                            } else if (state is PayrollInfoError) {
                              return Center(
                                child: Text(state.message),
                              );
                            } else {
                              return Text('Keadaan yang tidak terduga');
                            }
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: BlocBuilder<PayrollBloc, PayrollState>(
                          builder: (context, state) {
                            if (state is PayrollLoading) {
                              return Container(
                                color: Color.fromARGB(255, 245, 251,
                                    255), // Tambahkan latar belakang putih di sini
                                height: 100, // Tambahkan ketinggian di sini
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else if (state is PayrollInfoLoaded) {
                              final detailPayroll = state.dataPayroll;

                              return Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Atur posisi ke kiri
                                  children: [
                                    Text(
                                      'Earning Details',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Salary',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            SizedBox(
                                              width: 140,
                                            ), // Jarak antara 'NIK' dan nilai
                                            Text(
                                              detailPayroll?.totalTerimaGaji ??
                                                  'N/A',
                                              style: TextStyle(
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Positional Allowance',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            SizedBox(
                                              width: 35,
                                            ), // Jarak antara 'NIK' dan nilai
                                            Text(
                                              detailPayroll?.tunjanganJabatan ??
                                                  'N/A',
                                              style: TextStyle(
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Meal Allowance',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            SizedBox(
                                              width: 71,
                                            ), // Jarak antara 'NIK' dan nilai
                                            Text(
                                              detailPayroll?.totalUangMakan ??
                                                  'N/A',
                                              style: TextStyle(
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Transportation',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            SizedBox(
                                              width: 79,
                                            ), // Jarak antara 'NIK' dan nilai
                                            Text(
                                              detailPayroll
                                                      ?.totalUangTransport ??
                                                  'N/A',
                                              style: TextStyle(
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Unpaid Leave',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            SizedBox(
                                              width: 86,
                                            ), // Jarak antara 'NIK' dan nilai
                                            Text(
                                              detailPayroll
                                                      ?.potonganUnpaidLeave ??
                                                  'N/A',
                                              style: TextStyle(
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'BPJS Ketenagakerjaan',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            SizedBox(
                                              width: 23,
                                            ), // Jarak antara 'NIK' dan nilai
                                            Text(
                                              detailPayroll?.potonganBpjsTk ??
                                                  'N/A',
                                              style: TextStyle(
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              );
                            } else if (state is PayrollInfoNoData) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 20.0),
                                child: Text('No data available'),
                              );
                            } else if (state is PayrollInfoError) {
                              return Center(
                                child: Text(state.message),
                              );
                            } else {
                              return Text('Keadaan yang tidak terduga');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
