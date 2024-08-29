import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/bloc/bloc_creade_GS/cread_data_bloc.dart';
import 'package:hcm1011/presentasion/widgets/KPI/atom/form_code.dart';
import 'package:hcm1011/presentasion/widgets/KPI/atom/dropdown_satuan.dart';
import 'package:hcm1011/data/service/api_creat_gs.dart';
import 'package:hcm1011/presentasion/pages/kpi-list.dart';
import 'package:hcm1011/presentasion/bloc/bloc_form_detail_id/form_detail_id_bloc.dart';

class EditFormPageArgument {
  final String edit_id;
  final String? data;

  EditFormPageArgument({
    required this.edit_id,
    this.data,
  });
}

class FormGoalEdit extends StatefulWidget {
  static String route = "/editdetail";
  final EditFormPageArgument argument;
  const FormGoalEdit({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  State<FormGoalEdit> createState() => _FormGoalState();
}

class _FormGoalState extends State<FormGoalEdit> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<FormDetailIdBloc>().add(
            GetfromId(widget.argument.edit_id),
          );
    });
    super.initState();
  }

  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController jobDescController = TextEditingController();
  final TextEditingController bobotController = TextEditingController();
  final TextEditingController targetController = TextEditingController();
  final TextEditingController satuanTargetController = TextEditingController();
  final TextEditingController sessionIdController = TextEditingController();
  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      // Trigger the event to submit the form data
      context.read<CreadDataBloc>().add(
            SubmitDataEvent(
              jobDesc: jobDescController.text,
              bobot: bobotController.text,
              target: targetController.text,
              satuanTarget: satuanTargetController.text,
              sesionId: sessionIdController.text,
            ),
          );

      // Wait for the state change
      await Future.delayed(
          Duration(milliseconds: 500)); // Adjust delay if needed

      // Navigate to the new page after submission
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ListKpi(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreadDataBloc(
        apiCreateGS: CreateGs(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
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
                    'Item/Keterangan',
                    textAlign: TextAlign.start,
                    style: openSensBoldDark.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: jobDescController,
                    decoration: InputDecoration(
                      labelText: 'Item/Keterangan',
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: Icon(Icons.description),
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Wajib diisi';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Bobot',
                    textAlign: TextAlign.start,
                    style: openSensBoldDark.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: targetController,
                    decoration: InputDecoration(
                      labelText: 'Bobot',
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: Icon(Icons.description),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Wajib diisi';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  FormCode(sessionIdController: sessionIdController),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Target',
                              textAlign: TextAlign.left,
                              style: openSensBoldDark.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: satuanTargetController,
                              decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                prefixIcon: Icon(Icons.description),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                              maxLines: 1,
                              keyboardType: TextInputType.text,
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
                              'Satuan',
                              textAlign: TextAlign.left,
                              style: openSensBoldDark.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 8),
                            DropdownSatuan(
                              onChanged: (value) {
                                bobotController.text = value ?? '';
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: ElevatedButton(
                      onPressed: _submitForm,
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
                        'Save Goals Setting',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    jobDescController.dispose();
    bobotController.dispose();
    targetController.dispose();
    satuanTargetController.dispose();
    sessionIdController.dispose();
    super.dispose();
  }
}
