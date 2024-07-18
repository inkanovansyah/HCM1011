import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/bloc/bloc_creade_GS/cread_data_bloc.dart';
import 'package:hcm1011/presentasion/widgets/KPI/atom/form_code.dart';
import 'package:hcm1011/presentasion/widgets/KPI/atom/dropdown_satuan.dart';
import 'package:hcm1011/data/service/api_creat_gs.dart';

class FormGoal extends StatefulWidget {
  @override
  State<FormGoal> createState() => _FormGoalState();
}

class _FormGoalState extends State<FormGoal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController jobDescController = TextEditingController();
  final TextEditingController bobotController = TextEditingController();
  final TextEditingController targetController = TextEditingController();
  final TextEditingController satuanTargetController = TextEditingController();
  final TextEditingController sessionIdController = TextEditingController();

  bool _isLoading = false;

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
                    controller: bobotController,
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
                                targetController.text = value ?? '';
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });

                          final jobDesc = jobDescController.text;
                          final bobot = bobotController.text;
                          final target = targetController.text;
                          final satuanTarget = satuanTargetController.text;
                          final sesionId = sessionIdController.text;

                          context.read<CreadDataBloc>().add(
                                SubmitDataEvent(
                                  jobDesc: jobDesc,
                                  bobot: bobot,
                                  target: target,
                                  satuanTarget: satuanTarget,
                                  sesionId: sesionId,
                                ),
                              );

                          Future.delayed(Duration(seconds: 4), () {
                            setState(() {
                              _isLoading = false;
                            });
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        primary: darkdarkBlueColor,
                        minimumSize: Size(double.infinity, 60),
                      ),
                      child: _isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Save Goals Setting',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                    ),
                  ),
                  BlocBuilder<CreadDataBloc, CreadDataState>(
                    builder: (context, state) {
                      if (state is CreadDataLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CreadDataLoaded) {
                        return Text('Submission Successful');
                      } else if (state is CreadDataNoData) {
                        return Text('No Data: ${state.message}');
                      } else if (state is CreadDataError) {
                        return Text('Error: ${state.message}');
                      } else {
                        return Container();
                      }
                    },
                  ),
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
