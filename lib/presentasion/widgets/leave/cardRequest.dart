import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class CardRequest extends StatefulWidget {
  final String label_1;
  final String label_2;
  final String label_4;
  final String topRightLabel;
  final String status; // New status parameter

  CardRequest({
    required this.label_1,
    required this.label_2,
    required this.label_4,
    required this.topRightLabel,
    required this.status, // New status parameter
  });

  @override
  State<CardRequest> createState() => _CardRequest();
}

class _CardRequest extends State<CardRequest> {
  @override
  Widget build(BuildContext context) {
    Color labelColor;

    // Set label color based on status
    if (widget.status == 'Approved') {
      labelColor = Colors.green; // Green for Approved
    } else if (widget.status == 'Pending') {
      labelColor = Colors.orange; // Orange for Pending
    } else if (widget.status == 'Declined') {
      labelColor = Colors.red; // Red for Declined
    } else {
      labelColor = Colors.black; // Default color if status is not recognized
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 90,
            width: 360,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10, // Adjust the vertical position as needed
                  right: 10, // Adjust the horizontal position as needed
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: labelColor, // You can change the background color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      widget.topRightLabel, // Use the new label parameter
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.0), // Atur padding kiri sesuai kebutuhan
                          child: Text(
                            widget.label_1,
                            style: openSensBoldDark.copyWith(
                              fontSize: 16,
                              color: darkColor,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.0), // Atur padding kiri sesuai kebutuhan
                          child: Text(
                            widget.label_2,
                            style: openSensMediumDark.copyWith(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.0), // Atur padding kiri sesuai kebutuhan
                          child: Text(
                            widget.label_4,
                            style: openSensMediumDark.copyWith(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
