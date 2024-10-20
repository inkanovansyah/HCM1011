import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/bloc/bloc_my_trining/my_training_bloc.dart';

class CardTrining extends StatefulWidget {
  const CardTrining({super.key});

  @override
  State<CardTrining> createState() => _nameCardTrining();
}

class _nameCardTrining extends State<CardTrining> {
  void initState() {
    Future.microtask(
      () => context.read<MyTrainingBloc>().add(const GetMyTraining()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyTrainingBloc, MyTrainingState>(
      builder: (context, state) {
        if (state is MyTriningLoading) {
          return Container(
            color: Color.fromARGB(
                255, 245, 251, 255), // Tambahkan latar belakang putih di sini
            height: 100, // Tambahkan ketinggian di sini
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is MyTriningLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.data?.data?.length,
            itemBuilder: (context, index) {
              state.data?.data
                  ?.sort((a, b) => (b.id ?? '').compareTo(a.id ?? ''));
              // final id = state.data?.data?[index].id ?? '';
              final name = state.data?.data?[index].name;
              // final points = state.data?.data?[index].points;
              final certificateValue = state.data?.data?[index].hasCertificate;
              final String certificateStatus =
                  certificateValue == 1 ? "No Certificate" : "Certificate";
              final startDate = state.data?.data?[index].startDate;
              final endDate = state.data?.data?[index].endDate;
              // final vendor_name = state.data?.data?[index].vendorName;
              // Menghilangkan bagian waktu dari string tanggal
              final String formattedStartDate = startDate != null
                  ? '${startDate.toLocal().toIso8601String().split('T')[0]}'
                  : 'N/A';
              final String formattedEndDate = endDate != null
                  ? '${endDate.toLocal().toIso8601String().split('T')[0]}'
                  : 'N/A';
              return Container(
                color: Color(0xffEEF2FD),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white,
                            width: 4.0,
                          ),
                        ),
                        child: Padding(
                          // Padding ditambahkan di sini
                          padding: const EdgeInsets.all(
                              6.0), // Memberikan margin sebesar 2 piksel di semua sisi
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                      'assets/images/Profile_fo.png',
                                    ),
                                  ),
                                  Padding(
                                    // Menambahkan Padding di sekitar Column untuk memberi ruang
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${name}',
                                          style: openSensBoldDark.copyWith(
                                            fontSize: 16,
                                            color: darkColor,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          '${certificateStatus}',
                                          style: openSensMediumDark.copyWith(
                                            fontSize: 13,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          '${formattedStartDate} - ${formattedEndDate}',
                                          style: openSensMediumDark.copyWith(
                                            fontSize: 13,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // Lanjutkan dengan widget lainnya jika diperlukan
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is MyTriningError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 50.0), // Adjust the padding value as needed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/status/no_info.png',
                    height: 100, // Adjust height if necessary
                    width: 100, // Adjust width if necessary
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'No data available',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
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
  }
}
