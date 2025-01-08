import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/widgets/leave/leave.dart';
import 'package:hcm1011/presentasion/widgets/leave/cardRequest.dart';
import 'package:hcm1011/presentasion/widgets/body/form_leave_request.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hcm1011/presentasion/widgets/body/leave_request_bos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_leave/leave_bloc.dart';

class Leave extends StatefulWidget {
  const Leave({super.key});

  @override
  State<Leave> createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  bool showActions = true;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void showSessionTimeoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.info_outline, size: 50, color: Colors.grey),
              SizedBox(height: 16.0),
              Text(
                "Session Timeout!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                "You have been logged out due to inactivity.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    final bosId = prefs.getString('bos_id');
    final employeeId = prefs.getString('employee_id');

    if (token.isNotEmpty) {
      bool isExpired = JwtDecoder.isExpired(token);
      if (isExpired) {
        showSessionTimeoutDialog(context);
      } else {
        if (bosId != null && employeeId != null) {
          setState(() {
            showActions = bosId == employeeId;
          });
        }
      }
    } else {
      showSessionTimeoutDialog(context);
    }
  }

  Future<void> refreshData() async {
    context.read<LeaveBloc>().add(const GetListLeave());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Leave Request'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: showActions
            ? [
                IconButton(
                  icon: Icon(Icons.assignment),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LeaveBos(),
                      ),
                    );
                  },
                ),
              ]
            : [],
      ),
      backgroundColor: Color(0xffEEF2FD),
      body: SafeArea(
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: refreshData,
              child: Padding(
                padding: EdgeInsets.symmetric(),
                child: ListView(
                  children: [
                    Container(
                      color: Color.fromARGB(255, 245, 251, 255),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: ClipRRect(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                width: MediaQuery.of(context).size.width,
                                color: darkdarkBlueColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: LeaveW(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          CardRequest(),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => bodyFromLeave(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: Color(0xffD0D9F3),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Request', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
