import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hcm1011/presentasion/themes/global_themes.dart';

// import 'package:hcm1011/presentasion/widgets/KPI/atom/form_code.dart';
import 'package:hcm1011/presentasion/widgets/KPI/atom/dropdown_satuan.dart';

import 'package:hcm1011/presentasion/pages/kpi-list.dart';

import 'package:hcm1011/presentasion/bloc/bloc_edit_kpi/edit_kpi_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_update_goal_setting/update_goal_setting_bloc.dart';
import 'package:hcm1011/data/service/api_update_goalsetting.dart';

class EditFormKPIPageArgument {
  final String editkpi_id;
  final String? data;

  EditFormKPIPageArgument({
    required this.editkpi_id,
    this.data,
  });
}

class infoDetailFromKpi extends StatefulWidget {
  static String route = "/editkpidetail";
  final EditFormKPIPageArgument argumentFromKpiDetail;
  const infoDetailFromKpi({
    Key? key,
    required this.argumentFromKpiDetail,
  }) : super(key: key);

  @override
  State<infoDetailFromKpi> createState() => _infoDetailFromKpi();
}

class _infoDetailFromKpi extends State<infoDetailFromKpi> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<EditKpiBloc>().add(
            EditKpi(widget.argumentFromKpiDetail.editkpi_id),
          );
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController jobDescController = TextEditingController();
  final TextEditingController bobotController = TextEditingController();
  final TextEditingController targetController = TextEditingController();
  final TextEditingController satuanActualController = TextEditingController();
  final TextEditingController sessionIdController = TextEditingController();
  final TextEditingController formIdController = TextEditingController();
  final TextEditingController kpiController = TextEditingController();

  // Method to populate controllers with data from state
  void _populateFormData(EditKpiLoaded state) {
    var jsonString = state.editFormKpi.questionValue ?? '{}';
    Map<String, dynamic> questionValueMap = jsonDecode(jsonString);

    var jsonStringSelfValueWeek = state.editFormKpi.selfValueWeek ?? '[]';
    List<dynamic> selfValueWeekList = jsonDecode(jsonStringSelfValueWeek);
    int weekNumber = 5; // Specify the week you are interested in
    String weekValue = selfValueWeekList
        .firstWhere((week) => week['week'] == weekNumber,
            orElse: () => {'value': ''} // Default if the week is not found
            )['value']
        .toString();

    jobDescController.text = questionValueMap['jobs_desc'] ?? '';
    targetController.text = questionValueMap['target'] ?? '';
    satuanActualController.text = questionValueMap['satuan_target'] ?? '';
    bobotController.text = state.editFormKpi.weightage ?? '';
    sessionIdController.text = state.editFormKpi.sectionId ?? '';
    formIdController.text = state.editFormKpi.id ?? '';

    // Assign the extracted week value to kpiController.text
    kpiController.text = weekValue;
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<UpdateGoalSettingBloc>().add(
            UpdateGoalSettingEventSubmit(
              sectionId: sessionIdController.text.isNotEmpty
                  ? sessionIdController.text
                  : '',
              formId:
                  formIdController.text.isNotEmpty ? formIdController.text : '',
              jobDesc: jobDescController.text.isNotEmpty
                  ? jobDescController.text
                  : '',
              target:
                  targetController.text.isNotEmpty ? targetController.text : '',
              bobot:
                  bobotController.text.isNotEmpty ? bobotController.text : '',
              satuanTarget: satuanActualController.text.isNotEmpty
                  ? satuanActualController.text
                  : '',
              updateGoalSetting:
                  kpiController.text.isNotEmpty ? kpiController.text : '',
            ),
          );

      await Future.delayed(Duration(milliseconds: 500));

      // Show the success modal
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.green,
                      width: 4.0,
                    ),
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 50.0,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Update Successful!',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();

                  // Navigate to the ListKpi screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListKpi(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Form Add/Update KPI',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 223, 232, 255),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          BlocBuilder<EditKpiBloc, EditKpiState>(
            builder: (context, state) {
              if (state is EditKpiLoaded) {
                _populateFormData(state);
              }
              return _buildFormContent();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFormContent() {
    return BlocProvider(
      create: (context) => UpdateGoalSettingBloc(apiUpdateGS: UpdateGs()),
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
                    enabled: false, // Disable the input field
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
                    enabled: false, // Disable the input field
                  ),
                  // FormCode(sessionIdController: sessionIdController),
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
                              controller: targetController,
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
                              enabled: false, // Disable the input field
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
                                satuanActualController.text = value ?? '';
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Actual',
                    textAlign: TextAlign.start,
                    style: openSensBoldDark.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: kpiController,
                    decoration: InputDecoration(
                      labelText: 'Actual',
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
                        'Update KPI',
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
    satuanActualController.dispose();
    sessionIdController.dispose();
    formIdController.dispose();
    super.dispose();
  }
}
