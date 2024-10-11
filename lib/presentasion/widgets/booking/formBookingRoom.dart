import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/bloc/bloc_apply_booking/apply_booking_bloc.dart';
import 'package:hcm1011/presentasion/widgets/booking/atom/room.dart';
import 'package:hcm1011/presentasion/pages/booking.dart';

class FormRoom extends StatefulWidget {
  const FormRoom({super.key});

  @override
  State<FormRoom> createState() => _FormRoomState();
}

class _FormRoomState extends State<FormRoom> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController roomController = TextEditingController();
  final TextEditingController kegiatanController = TextEditingController();
  final TextEditingController keteranganController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  Future<void> _selectDateTime(
      BuildContext context, TextEditingController controller) async {
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(now),
      );

      if (pickedTime != null) {
        final DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
        final String formatted = formatter.format(selectedDateTime);

        setState(() {
          controller.text = formatted;
        });
      }
    }
  }

  int _getLeaveTypeId(String leaveType) {
    switch (leaveType) {
      case 'Ruang meeting Besar':
        return 1;
      case 'Ruang Meeting Atas':
        return 2;
      case 'Ruang Meeting Kecil':
        return 3;
      case 'Ruang Postpro':
        return 4;
      case 'Ruang Konsultasi':
        return 5;
      default:
        return 0;
    }
  }

  Future<void> _applyForLeave() async {
    if (_formKey.currentState?.validate() ?? false) {
      BlocProvider.of<ApplyBookingBloc>(context).add(ApplyBookingSubmitEvent(
        room: _getLeaveTypeId(roomController.text).toString(),
        startdate: startDateController.text.toString(),
        enddate: endDateController.text.toString(),
        title: keteranganController.text.toString(),
        descrip: kegiatanController.text.toString(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApplyBookingBloc, ApplyBookingState>(
      listener: (context, state) {
        if (state is ApplyBookingLoading) {
          // Optional: Update UI if necessary during loading
        } else if (state is ApplyBookingLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  state.messages ?? 'Tidak ada pesan'), // Berikan nilai default
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PageBooking(),
            ),
          );
        } else if (state is ApplyBookingError) {
          // Tangani kondisi error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.message}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 6.0,
            margin: EdgeInsets.symmetric(vertical: 0.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Meeting Room',
                      textAlign: TextAlign.start,
                      style: openSensBoldDark.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    TypeRoom(roomController: roomController),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Start Date',
                                textAlign: TextAlign.left,
                                style: openSensBoldDark.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                controller: startDateController,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  prefixIcon: Icon(Icons.calendar_today),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                readOnly: true,
                                onTap: () => _selectDateTime(
                                    context, startDateController),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Required fields';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'End Time',
                                textAlign: TextAlign.left,
                                style: openSensBoldDark.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                controller: endDateController,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  prefixIcon: Icon(Icons.calendar_today),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                readOnly: true,
                                onTap: () =>
                                    _selectDateTime(context, endDateController),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Required fields';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Activity Title',
                      textAlign: TextAlign.start,
                      style: openSensBoldDark.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: keteranganController,
                      decoration: InputDecoration(
                        labelText: 'Activity Title',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required fields';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Information',
                      textAlign: TextAlign.start,
                      style: openSensBoldDark.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: kegiatanController,
                      decoration: InputDecoration(
                        labelText: 'Information',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required fields';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.0),
                      child: ElevatedButton(
                        onPressed: _applyForLeave,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: darkdarkBlueColor,
                          minimumSize: Size(double.infinity, 60),
                        ),
                        child: Text(
                          'Submit a Space Request',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    roomController.dispose();
    keteranganController.dispose();
    kegiatanController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }
}
