import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/pages/info_detail.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/bloc/bloc_list_info/list_info_bloc.dart';

class CardSchedule extends StatefulWidget {
  // const cardSchedule({super.key});
  const CardSchedule({Key? key}) : super(key: key);

  @override
  State<CardSchedule> createState() => _cardSchedule();
}

class _cardSchedule extends State<CardSchedule> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<ListInfoBloc>().add(const GetList()),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListInfoBloc, ListInfoState>(
      builder: (context, state) {
        if (state is ListInfoLoading) {
          return Container(
            color: Color.fromARGB(
                255, 245, 251, 255), // Tambahkan latar belakang putih di sini
            height: 100, // Tambahkan ketinggian di sini
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ListInfoLoaded) {
          // return _buildCard(context, state.modelList);

          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.infoList?.length,
            itemBuilder: (context, index) {
              state.infoList
                  ?.sort((a, b) => (b?.id ?? '').compareTo(a?.id ?? ''));
              final id = state.infoList?[index]?.id ?? '';
              final author = state.infoList?[index].author;
              final title = state.infoList?[index].title;
              final media = state.infoList?[index].media;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        infoDetail.route,
                        arguments: DetailPageArgument(info_id: id),
                      );

                      print('Card Clicked! ${id}');
                      // Anda dapat menavigasi ke layar baru atau melakukan tindakan lainnya.
                    },
                    child: Container(
                      height: 90,
                      width: 159,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFF1BEFC7), // Warna garis tepi (strok)
                          width: 1.0, // Lebar garis tepi (strok)
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              media != null
                                  ? '$media'
                                  : 'assets/images/Profile_test.png',
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  '${title}',
                                  style: openSensBoldDark.copyWith(
                                    fontSize: 16,
                                    color: darkColor,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  '${author}',
                                  style: openSensMediumDark.copyWith(
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is ListInfoError) {
          return Center(
            child: Text(state.message),
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
