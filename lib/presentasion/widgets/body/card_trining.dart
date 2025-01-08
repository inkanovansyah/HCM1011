import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hcm1011/presentasion/bloc/bloc_achadule_list/schadule_list_bloc.dart';
// import 'package:hcm1011/presentasion/widgets/body/schadule.dart';

class TrainingScheduleCardList extends StatefulWidget {
  const TrainingScheduleCardList({Key? key}) : super(key: key);

  @override
  State<TrainingScheduleCardList> createState() => _ScheduleCardList();
}

class _ScheduleCardList extends State<TrainingScheduleCardList> {
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Training Schedule",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Tambahkan aksi untuk tombol "More Training" jika diperlukan
                },
                child: Text(
                  "More Training",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Card List
          SizedBox(
            height: 120,
            child: BlocBuilder<SchaduleListBloc, SchaduleListState>(
              builder: (context, state) {
                if (state is SchaduleListLoading) {
                  return Container(
                    color: const Color.fromARGB(255, 245, 251, 255),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is SchaduleListLoaded) {
                  // Sort data if necessary
                  final data = state.data?.data ?? [];
                  data.sort((a, b) => (b.trainingScheduleId ?? '')
                      .compareTo(a.trainingScheduleId ?? ''));

                  // Horizontal ListView
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = data[index];
                      final id = item.trainingScheduleId ?? '';
                      final name = item.trainingName ?? '';
                      final certificateValue = item.description ?? '';
                      final location = item.location ?? '';
                      final trainerName = item.trainerName ?? '';
                      final vendorName = item.vendorName ?? '';

                      return SizedBox(
                        width: 250,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Row with Icon and Title
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.grey.shade300,
                                      ),
                                      child: const Icon(
                                        Icons.insert_drive_file,
                                        size: 24,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            trainerName,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                // Description
                                Text(
                                  certificateValue,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade700,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
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
                          const SizedBox(height: 6),
                          const Text(
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
                    color: const Color(0xffEEF2FD),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
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
          )
        ],
      ),
    );
  }
}
