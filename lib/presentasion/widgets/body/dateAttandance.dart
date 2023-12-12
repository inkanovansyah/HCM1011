import 'package:flutter/material.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class dateAttandance extends StatefulWidget {
  const dateAttandance({Key? key});

  @override
  State<dateAttandance> createState() => _dateAttandanceState();
}

class _dateAttandanceState extends State<dateAttandance> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Center(
            child: WeeklyDatePicker(
              selectedDay: _selectedDay,
              changeDay: (value) => setState(() {
                _selectedDay = value; // Memperbarui tanggal yang dipilih
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
          ),
          Detail(
              selectedDate:
                  _selectedDay), // Mengirim tanggal yang dipilih ke widget Detail
        ],
      ),
    );
  }
}

class Detail extends StatelessWidget {
  final DateTime selectedDate;

  const Detail({Key? key, required this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Gunakan selectedDate untuk menghasilkan konten sesuai tanggal yang dipilih
    return Container(
        // Konten berdasarkan selectedDate
        );
  }
}
