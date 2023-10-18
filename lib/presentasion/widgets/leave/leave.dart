import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class leaveW extends StatefulWidget {
  // final String label_1;
  // final String label_2;
  // final String label_3;
  // final String label_4;
  // final String leave;
  // final String status;
  // final String durasi;
  // final String note;

  // leaveW({
  //   required this.label_1,
  //   required this.label_2,
  //   required this.label_3,
  //   required this.label_4,
  //   required this.leave,
  //   required this.status,
  //   required this.durasi,
  //   required this.note,
  // });

  @override
  State<leaveW> createState() => _leaveState();
}

class _leaveState extends State<leaveW> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 5.0), // Jarak kanan dan kiri 10 piksel
          child: _customizeDayAppearanceExample(context),
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }

  EasyDateTimeLine _customizeDayAppearanceExample(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      headerProps: const EasyHeaderProps(
        selectedDateFormat: SelectedDateFormat.fullDateMonthAsStrDY,
      ),
      activeColor: Color.fromARGB(255, 255, 255, 255),
      dayProps: const EasyDayProps(
        height: 80.0,
        width: 75.0,
        dayStructure: DayStructure.dayNumDayStr,
        todayHighlightStyle: TodayHighlightStyle.withBackground,
        todayHighlightColor: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
