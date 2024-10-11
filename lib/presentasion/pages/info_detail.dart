import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/bloc/bloc_Detail/detail_info_bloc.dart';

class DetailPageArgument {
  final String info_id;
  final String? data;

  DetailPageArgument({
    required this.info_id,
    this.data,
  });
}

class infoDetail extends StatefulWidget {
  static String route = "/detail";
  final DetailPageArgument argument;
  const infoDetail({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  State<infoDetail> createState() => _infoState();
}

class _infoState extends State<infoDetail> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<DetailInfoBloc>().add(
            GetDetailInfo(widget.argument.info_id),
          );
    });
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
          'Info Detail',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous page
          },
        ),
      ),
      body: BlocBuilder<DetailInfoBloc, DetailInfoState>(
          builder: (context, state) {
        if (state is DetailInfoLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DetailInfoLoaded) {
          // final src = state.detailList;
          return SingleChildScrollView(
            child: Container(
              color: Color(0xffEEF2FD),
              child: Column(
                children: [
                  Padding(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 60,
                                    width: 60,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          10), // Sesuaikan dengan radius yang diinginkan
                                      child: Image.network(
                                        state.detailList.content,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/images/Profile_test.png',
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          state.detailList.title.length > 25
                                              ? state.detailList.title
                                                      .substring(0, 20) +
                                                  '..'
                                              : state.detailList.title,
                                          style: openSensBoldDark.copyWith(
                                            fontSize: 18,
                                            color: darkColor,
                                          ),
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow
                                              .ellipsis, // Menambahkan elipsis pada teks yang melebihi
                                          maxLines:
                                              1, // Batasan jumlah baris teks yang ditampilkan
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          DateFormat('dd-MM-yyyy').format(
                                              state.detailList.createdAt),
                                          style: openSensMediumDark.copyWith(
                                            fontSize: 13,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Container(
                                      height: 240,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            20.0), // Ubah nilai sesuai kebutuhan
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            20.0), // Sama dengan nilai di atas
                                        child: Image.network(
                                          state.detailList.content,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              'assets/images/default.png',
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        state.detailList.content,
                                        style: openSensMediumDark.copyWith(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is DetailInfoError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Text("");
        }
      }),
    );
  }
}
