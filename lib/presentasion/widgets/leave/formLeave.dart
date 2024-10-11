import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/leave/dropdown/typeLeave.dart';
import 'package:hcm1011/presentasion/widgets/leave/dropdown/replacementbyDepartment.dart';
import 'package:hcm1011/presentasion/bloc/bloc_apply_leave/apply_leave_bloc.dart';
import 'package:hcm1011/data/service/api_apply_leave.dart';
import 'package:hcm1011/presentasion/pages/leave.dart';

class FormLeave extends StatefulWidget {
  const FormLeave({super.key});

  @override
  State<FormLeave> createState() => _FormLeaveState();
}

class _FormLeaveState extends State<FormLeave> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController leaveTypeController = TextEditingController();
  final TextEditingController penggantiController = TextEditingController();
  final TextEditingController leaveReasonController = TextEditingController();
  bool _isLoading = false;

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  String _getLeaveTypeId(String leaveType) {
    switch (leaveType) {
      case 'CUTI TAHUNAN':
        return '1'; // Mengembalikan sebagai String
      case 'CUTI MELAHIRKAN':
        return '2';
      case 'CUTI SPESIAL':
        return '3';
      default:
        return '0';
    }
  }

  Future<void> _applyForLeave() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      // Mendapatkan leaveTypeId sebagai integer
      // Mendapatkan leaveTypeId sebagai String
      String leaveTypeIdString = _getLeaveTypeId(leaveTypeController.text);

      // Trigger the BLoC event dengan leaveTypeIdString sebagai String
      BlocProvider.of<ApplyLeaveBloc>(context).add(ApplyLeaveSubmitEvent(
        startdate: startDateController.text,
        enddate: endDateController.text,
        leaveType: leaveTypeIdString, // Kirim sebagai String
        descrip: leaveReasonController.text,
      ));
      // Wait for a short duration to simulate processing
      await Future.delayed(Duration(milliseconds: 500)); // Adjust as needed

      // Check the state and navigate based on success or failure
      if (context.read<ApplyLeaveBloc>().state is ApplyLeaveLoaded) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Successfully applied for leave'),
            backgroundColor: Colors.green, // Menetapkan warna hijau
          ),
        );
        // Navigate to the desired page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Leave(),
          ),
        );
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to apply for leave'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApplyLeaveBloc(
        ApplyLeaveapi: ApplyLeave(),
      ),
      child: BlocListener<ApplyLeaveBloc, ApplyLeaveState>(
        listener: (context, state) {
          if (state is ApplyLeaveLoaded) {
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Leave Application Successful')),
            );
          } else if (state is ApplyLeaveNoData || state is ApplyLeaveError) {
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      'Leave Application Failed: ${state is ApplyLeaveError ? state.message : (state as ApplyLeaveNoData).message}')),
            );
          } else if (state is ApplyLeaveLoading) {
            setState(() {
              _isLoading = true;
            });
          }
        },
        child: Padding(
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
                      'Leave Type',
                      textAlign: TextAlign.start,
                      style: openSensBoldDark.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    TypeLeave(leaveTypeController: leaveTypeController),
                    SizedBox(height: 10),
                    Text(
                      'Replacement',
                      textAlign: TextAlign.start,
                      style: openSensBoldDark.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Replacement(ReplacmentController: penggantiController),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Start date',
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
                                onTap: () =>
                                    _selectDate(context, startDateController),
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
                                'End date',
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
                                    _selectDate(context, endDateController),
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
                      'Information',
                      textAlign: TextAlign.start,
                      style: openSensBoldDark.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: leaveReasonController,
                      decoration: InputDecoration(
                        labelText: 'Leave Reason',
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
                        child: _isLoading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Apply For Leave',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    leaveTypeController.dispose();
    penggantiController.dispose();
    leaveReasonController.dispose();
    super.dispose();
  }
}
