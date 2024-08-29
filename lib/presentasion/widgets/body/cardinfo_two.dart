import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class CardInfoTwo extends StatefulWidget {
  @override
  State<CardInfoTwo> createState() => _CardInfotwoState();
}

class _CardInfotwoState extends State<CardInfoTwo> {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -30), // Geser ke atas sebanyak 30 piksel
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.13,
        width:
            MediaQuery.of(context).size.width * 0.47, // Adjust width if needed
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.4), // Reduced padding
          child: Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 0.0,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/images/Asset_1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Not yet available',
                        style: TextStyle(
                          fontSize: 16,
                          color: darkdarkBlueColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
