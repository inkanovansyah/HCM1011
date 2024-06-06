import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/KPI/form_goal_setting.dart';

class FormGoalSetting extends StatefulWidget {
  const FormGoalSetting({super.key});

  @override
  State<FormGoalSetting> createState() => _FormGoalSetting();
}

class _FormGoalSetting extends State<FormGoalSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Form Goal Setting',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous page
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 223, 232, 255),
      body: FormGoal(),
    );
  }
}
