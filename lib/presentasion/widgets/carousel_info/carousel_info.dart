import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/pages/info_detail.dart';
import 'package:hcm1011/presentasion/bloc/bloc_list/list_bloc.dart';

class InfoCarousel extends StatefulWidget {
  const InfoCarousel({Key? key}) : super(key: key);

  @override
  State<InfoCarousel> createState() => _InfoCarouselState();
}

class _InfoCarouselState extends State<InfoCarousel> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Future.microtask(
      () => context.read<ListBloc>().add(const GetListInfo()),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListBloc, ListState>(
      builder: (context, state) {
        if (state is InfoLoading) {
          return Center(
              child: CircularProgressIndicator()); // Customize loading state
        } else if (state is InfoLoaded) {
          // Sort the state.infoList ascending based on ID
          if (state.infoList != null) {
            state.infoList!.sort((a, b) {
              if (a.id == null && b.id == null) return 0;
              if (a.id == null) return 1;
              if (b.id == null) return -1;
              return a.id!.compareTo(b.id!);
            });
          }

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.white, // Changed background color to white
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 200, // Adjust height as needed
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: state.infoList?.length ?? 0,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final info = state.infoList![index];
                        final id = info.id!;
                        final media = info.media;
                        final title = info.title;

                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              infoDetail.route,
                              arguments: DetailPageArgument(info_id: id),
                            );
                          },
                          child: Card(
                            margin: EdgeInsets.symmetric(horizontal: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    media != null
                                        ? '$media'
                                        : 'assets/images/default.png',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 200,
                                  ),
                                ),
                                Positioned(
                                  left: 16,
                                  bottom: 16,
                                  child: Text(
                                    '$title',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Dots indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: state.infoList!.asMap().entries.map((entry) {
                    int index = entry.key;
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: _currentIndex == index ? 12.0 : 8.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentIndex == index ? Colors.black : Colors.grey,
                      ),
                    );
                  }).toList(),
                ),
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
          return Text('Unexpected state');
        }
      },
    );
  }
}
