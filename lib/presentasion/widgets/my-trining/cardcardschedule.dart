import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                // final points = state.data?.data?[index].points;
                final certificateValue = state.data?.data?[index].description;
                final String certificateStatus =
                    certificateValue == 1 ? "No Certificate" : "Certificate";
                final startDate = state.data?.data?[index].startDate;
                final endDate = state.data?.data?[index].endDate;
                // final vendorName = state.data?.data?[index].vendorName;

                // Format dates
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
                      child: ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        leading: Container(
                          height: 60,
                          width: 60,
                          child: Image.asset('assets/images/Profile_fo.png'),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name ?? 'N/A',
                              style: openSensBoldDark.copyWith(
                                fontSize: 16,
                                color: darkColor,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              certificateStatus,
                              style: openSensMediumDark.copyWith(
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '$formattedStartDate - $formattedEndDate',
                              style: openSensMediumDark.copyWith(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            if (id.isNotEmpty) {
                              context
                                  .read<ApplyTrainingBloc>()
                                  .add(ApplyTriningEvent(idschedule: id));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'You have registered for training')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Button color
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Join',
                            style: TextStyle(color: Colors.white), // Text color
                          ),
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
