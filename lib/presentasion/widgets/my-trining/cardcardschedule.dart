import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/bloc/bloc_achadule_list/schadule_list_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_apply_traning/apply_training_bloc.dart';

class CardSchedule extends StatefulWidget {
  const CardSchedule({super.key});

  @override
  State<CardSchedule> createState() => _CardScheduleState();
}

class _CardScheduleState extends State<CardSchedule> {
  @override
  void initState() {
    super.initState();
    // Fetch schedule data when the widget is initialized
    Future.microtask(
      () => context.read<SchaduleListBloc>().add(const GetSchaduleList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApplyTrainingBloc, ApplyTrainingState>(
      listener: (context, state) {
        if (state is ApplyTrainingLoaded) {
          // Refresh the goal setting list after delete
          context.read<SchaduleListBloc>().add(
              const GetSchaduleList()); // Show snackbar if there's an error applying training
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You have registered for training')),
          );
        } else if (state is ApplyTrainingError) {
          // Show snackbar if there's an error applying training
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: BlocBuilder<SchaduleListBloc, SchaduleListState>(
        builder: (context, state) {
          if (state is SchaduleListLoading) {
            return Container(
              color: Color.fromARGB(255, 245, 251, 255), // Background color
              height: 100,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is SchaduleListLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.data?.data?.length,
              itemBuilder: (context, index) {
                state.data?.data?.sort((a, b) => (b.trainingScheduleId ?? '')
                    .compareTo(a.trainingScheduleId ?? ''));
                final id = state.data?.data?[index].trainingScheduleId ?? '';
                final name = state.data?.data?[index].trainingName;
                final certificateValue = state.data?.data?[index].description;
                final location = state.data?.data?[index].location;
                final trainerName = state.data?.data?[index].trainerName;
                final vendorName = state.data?.data?[index].vendorName;
                final startDate = state.data?.data?[index].startDate;
                final endDate = state.data?.data?[index].endDate;
                final points = state.data?.data?[index].points;

                // Format tanggal

                final String formattedStartDate = startDate != null
                    ? DateFormat('d MMM yyyy').format(startDate)
                    : 'N/A';
                final String formattedEndDate = endDate != null
                    ? DateFormat('d MMM yyyy').format(endDate)
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
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 24,
                                      backgroundImage: AssetImage(
                                          'assets/images/Profile_fo.png'),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      name ?? 'N/A',
                                      style: openSensBoldDark.copyWith(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (id.isNotEmpty) {
                                      context.read<ApplyTrainingBloc>().add(
                                          ApplyTriningEvent(idschedule: id));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'You have registered for training')),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        darkdarkBlueColor, // Warna tombol
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Join',
                                    style: TextStyle(
                                        color:
                                            Colors.white), // Warna teks tombol
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Divider(
                              color: const Color.fromARGB(
                                  255, 194, 194, 194), // Warna garis
                              thickness: 1.0, // Ketebalan garis
                            ),
                            SizedBox(height: 4),
                            Text(
                              certificateValue ?? 'N/A',
                              style: openSensMediumDark.copyWith(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 152, 152, 152),
                              ),
                              textAlign:
                                  TextAlign.left, // Mengatur teks rata kiri
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.person,
                                    size: 16), // Ikon untuk trainer
                                SizedBox(width: 4),
                                Text(
                                  trainerName ?? 'N/A',
                                  style: openSensMediumDark.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.business,
                                    size: 16), // Ikon untuk vendor
                                SizedBox(width: 4),
                                Text(
                                  vendorName ?? 'N/A',
                                  style: openSensMediumDark.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.location_on,
                                    size: 16), // Ikon untuk lokasi
                                SizedBox(width: 4),
                                Text(
                                  location ?? 'N/A',
                                  style: openSensMediumDark.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.star, size: 16), // Ikon untuk poin
                                SizedBox(width: 4),
                                Text(
                                  '$points Point',
                                  style: openSensMediumDark.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.date_range,
                                    size: 16), // Ikon untuk tanggal
                                SizedBox(width: 4),
                                Text(
                                  '$formattedStartDate - $formattedEndDate',
                                  style: openSensMediumDark.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is SchaduleListError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/status/no_info.png',
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(height: 6),
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
                    'No data...',
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
      ),
    );
  }
}
