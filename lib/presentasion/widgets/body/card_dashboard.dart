import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hcm1011/presentasion/pages/info_detail.dart';
import 'package:hcm1011/presentasion/bloc/bloc_list_info/list_info_bloc.dart';

class CardSchedule extends StatefulWidget {
  const CardSchedule({Key? key}) : super(key: key);

  @override
  State<CardSchedule> createState() => _CardScheduleState();
}

class _CardScheduleState extends State<CardSchedule> {
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
          return ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is ListInfoLoaded) {
          if (state.infoList == null || state.infoList!.isEmpty) {
            return const Center(
              child: Text(
                'No data available',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Text(
                    "Today's Focus",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.infoList?.length,
                  itemBuilder: (context, index) {
                    state.infoList
                        ?.sort((a, b) => (b.id ?? '').compareTo(a.id ?? ''));
                    final id = state.infoList?[index].id ?? '';
                    final author = state.infoList?[index].author ?? 'Unknown';
                    final title = state.infoList?[index].title ?? 'No Title';
                    final media = state.infoList?[index].media;
                    final summary = state.infoList?[index].summary ?? '';

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            infoDetail.route,
                            arguments: DetailPageArgument(info_id: id),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Avatar
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: media != null
                                  ? AssetImage('$media')
                                  : const AssetImage(
                                      'assets/images/Profile_test.png'),
                            ),
                            const SizedBox(width: 12),
                            // Konten Text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Judul
                                  Text(
                                    title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  // Author
                                  Text(
                                    author,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  // Deskripsi
                                  Text(
                                    summary,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
        } else if (state is ListInfoError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        } else {
          return const Center(
            child: Text(
              'Failed to load data',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
      },
    );
  }
}
