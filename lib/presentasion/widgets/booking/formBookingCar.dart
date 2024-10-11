import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/bloc/bloc_booking_car/booking_car_bloc.dart';
// import 'package:hcm1011/presentasion/widgets/booking/atom/room.dart';
import 'package:hcm1011/presentasion/widgets/booking/atom/type_car.dart';
import 'package:hcm1011/presentasion/pages/booking.dart';

class FormCar extends StatefulWidget {
  const FormCar({super.key});

  @override
  State<FormCar> createState() => _FormCarState();
}

class _FormCarState extends State<FormCar> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController roomController = TextEditingController();
  final TextEditingController kegiatanController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  int _getLeaveTypeId(String leaveType) {
    switch (leaveType) {
      case 'Ruang meeting Besar':
        return 1;
      default:
        return 0;
    }
  }

  void _applyForLeave() {
    if (_formKey.currentState?.validate() ?? false) {
      BlocProvider.of<BookingCarBloc>(context).add(GetBookingCar(
        bookingmobil_id: _getLeaveTypeId(roomController.text).toString(),
        bookingStart: startDateController.text,
        bookingEnd: endDateController.text,
        deskripsi: kegiatanController.text,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCarBloc, BookingCarState>(
      listener: (context, state) {
        if (state is BookingCarLoading) {
          // Optional: Show loading indicator
        } else if (state is BookingCarError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(' ${state.message}'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is BookingCarLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.message}'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PageBooking(),
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
                      'Select a car',
                      textAlign: TextAlign.start,
                      style: openSensBoldDark.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    TypeCar(typeCarController: roomController),
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
                                    return 'Wajib diisi';
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
                                'End Date',
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
                                    return 'Wajib diisi';
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
                      'Informasi',
                      textAlign: TextAlign.start,
                      style: openSensBoldDark.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: kegiatanController,
                      decoration: InputDecoration(
                        labelText: 'Informasi',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Wajib diisi';
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
                          'Submit Car Application',
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

        // Menggunakan DateFormat untuk format yang sesuai
        final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
        final String formatted = formatter.format(selectedDateTime);

        setState(() {
          controller.text = formatted;
        });
      }
    }
  }

  @override
  void dispose() {
    roomController.dispose();
    kegiatanController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }
}
