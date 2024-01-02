import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hcm1011/presentasion/pages/info_detail.dart';
import 'package:hcm1011/presentasion/bloc/bloc_list/list_bloc.dart';
// import 'package:banner_carousel/banner_carousel.dart';

class InfoCarousel extends StatefulWidget {
  const InfoCarousel({Key? key}) : super(key: key);
  @override
  State<InfoCarousel> createState() => _InfoCarouselState();
}

class _InfoCarouselState extends State<InfoCarousel> {
  int _currentIndex = 0;
  @override
  void initState() {
    Future.microtask(
      () => context.read<ListBloc>().add(const GetListInfo()),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListBloc, ListState>(
      builder: (context, state) {
        if (state is InfoLoading) {
          return Container(
            color: Color.fromARGB(
                255, 245, 251, 255), // Tambahkan latar belakang putih di sini
            height: 100, // Tambahkan ketinggian di sini
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is InfoLoaded) {
          // Sort the state.infoList ascending based on ID
          state.infoList.sort((a, b) => a.id.compareTo(b.id));
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CarouselSlider(
                  items: state.infoList.map(
                    (info) {
                      final id = info.id;
                      final media = info.media;
                      final title = info.title;
                      // final author = info.summary;

                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            infoDetail.route,
                            arguments: DetailPageArgument(info_id: id),
                          );
                        },
                        child: Container(
                          // You can customize each item in the carousel here
                          child: Stack(
                            children: [
                              Image.asset(
                                media != null
                                    ? '$media'
                                    : 'assets/images/default.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 200,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 70, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 2.0),
                                      child: Text(
                                        '${title}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsets.only(top: 2.0),
                                    //   child: Text(
                                    //     '${author}',
                                    //     style: TextStyle(
                                    //       color: Colors.white,
                                    //       fontSize: 12,
                                    //       fontWeight: FontWeight.bold,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  options: CarouselOptions(
                    height: 200,

                    enableInfiniteScroll: true,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex =
                            index; // Perbarui posisi saat carousel berubah
                      });
                      // Perform actions based on the index change
                    },
                    // Other options you may want to customize
                  ),
                ),
                Transform.translate(
                  offset: Offset(0.0,
                      -30.0), // Sesuaikan ofset sesuai kebutuhan (-30.0 untuk naik)
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: state.infoList.asMap().entries.map((entry) {
                      int index = entry.key;
                      return index == _currentIndex
                          ? Transform.scale(
                              scale: 1.3,
                              child: AnimatedContainer(
                                width: 12.0,
                                height: 10.0,
                                duration: Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : AnimatedContainer(
                              width: 8.0,
                              height: 10.0,
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            );
                    }).toList(),
                  ),
                )
              ],
            ),
          );
        } else if (state is InfoNoData) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: Text('No data available'),
          );
        } else if (state is InfoError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Text('Keadaan yang tidak terduga');
        }
      },
    );
  }
}
