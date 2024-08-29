import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/widgets/notification/card_notification.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffEEF2FD),
      child: ListView(
        children: [
          CardNotification(),
        ],
      ),
    );
  }
}
