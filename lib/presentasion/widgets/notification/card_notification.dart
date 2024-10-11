import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'package:hcm1011/presentasion/bloc/bloc_read_notification/read_notification_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_notification/notification_bloc.dart';

class CardNotification extends StatefulWidget {
  const CardNotification({super.key});

  @override
  State<CardNotification> createState() => _CardNotificationState();
}

class _CardNotificationState extends State<CardNotification> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<NotificationBloc>().add(
            GetNotificationList(),
          ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReadNotificationBloc, ReadNotificationState>(
      listener: (context, state) {
        if (state is ReadNotificationLoaded) {
          context.read<NotificationBloc>().add(GetNotificationList());
        }
      },
      child: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoading) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5, // Number of shimmer items you want to display
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Card(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                        title: Container(
                          height: 16.0,
                          width: double.infinity,
                          color: Colors.grey[300],
                        ),
                        subtitle: Container(
                          height: 12.0,
                          width: 150.0,
                          color: Colors.grey[300],
                        ),
                        trailing: Container(
                          height: 10.0,
                          width: 10.0,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is NotificationLoaded) {
            final notifications = state.notificationList?.data?.data;

            if (notifications == null || notifications.isEmpty) {
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
              final reversedNotifications = notifications.reversed.toList();

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reversedNotifications.length,
                itemBuilder: (context, index) {
                  final notification = reversedNotifications[index];
                  final id = notification?.id ?? 'No id';
                  final desc = notification?.activityDesc ?? 'No description';
                  final create = notification?.createdAt?.toIso8601String() ??
                      'Unknown time';
                  final isRead = notification?.isRead;

                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: InkWell(
                      onTap: () {
                        if (id != 'No id') {
                          context
                              .read<ReadNotificationBloc>()
                              .add(ReadNotificationGetEvent(idNotif: id));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Notification ID is missing')),
                          );
                        }
                      },
                      child: Card(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          leading: CircleAvatar(
                            backgroundColor: Colors.pink[100],
                            child: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  desc,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            create,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          trailing: Icon(
                            Icons.circle,
                            color: isRead == '0' ? Colors.red : Colors.white,
                            size: 10,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          } else if (state is NotificationError) {
            return Container(
              color: const Color.fromARGB(255, 245, 251, 255),
              height: 100,
              child: Center(
                child: Text(state.message),
              ),
            );
          } else {
            return Container(
              color: const Color.fromARGB(255, 245, 251, 255),
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(height: 10),
                  Text(
                    'Failed to load data',
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
