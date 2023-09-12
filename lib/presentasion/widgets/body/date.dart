import 'package:flutter/material.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class date extends StatefulWidget {
  // const name({super.key});

  @override
  State<date> createState() => _nameDate();
}

class _nameDate extends State<date> {
  DateTime _selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          WeeklyDatePicker(
            selectedDay: _selectedDay,
            changeDay: (value) => setState(() {
              _selectedDay = value;
            }),
            enableWeeknumberText: false,
            weeknumberColor: const Color(0xFF57AF87),
            weeknumberTextColor: Color.fromARGB(255, 49, 45, 45),
            backgroundColor: Colors.white,
            weekdayTextColor: const Color(0xFF8A8A8A),
            digitsColor: const Color.fromARGB(255, 63, 57, 57),
            selectedBackgroundColor: const Color(0xFF57AF87),
            weekdays: const ["Senin", "Selasa", "Rabu", "Kamis", "Jumat"],
            daysInWeek: 5,
          ),
        ],
      ),
    );
  }
}
