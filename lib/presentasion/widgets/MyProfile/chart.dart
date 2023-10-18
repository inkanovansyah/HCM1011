import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';

class viewchart extends StatefulWidget {
  @override
  State<viewchart> createState() => _profileState();
}

class _profileState extends State<viewchart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10), // Add 20 pixels margin on both sides
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Bentuk border card
        ), // Card elevation for a shadow effect
        child: Padding(
          padding: EdgeInsets.all(18), // Padding inside the card
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align content to the left
            children: [
              // chart(),
            ],
          ),
        ),
      ),
    );
  }
}

class chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('D\'Chart')),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: DChartBarO(
              groupList: [
                OrdinalGroup(
                  id: '1',
                  data: [
                    OrdinalData(domain: 'Mon', measure: 2),
                    OrdinalData(domain: 'Tue', measure: 6),
                    OrdinalData(domain: 'Wed', measure: 3),
                    OrdinalData(domain: 'Thu', measure: 7),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
