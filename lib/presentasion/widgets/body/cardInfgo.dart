import 'package:flutter/material.dart';

class CardInfo extends StatefulWidget {
  final String label_1;
  final String label_2;
  final String color;
  final String img;
  final String colorText;

  CardInfo({
    required this.label_1,
    required this.label_2,
    required this.color,
    required this.img,
    required this.colorText,
  });

  @override
  State<CardInfo> createState() => _nameInfo();
}

class _nameInfo extends State<CardInfo> {
  @override
  Widget build(BuildContext context) {
    Color cardColor = widget.color == 'blue' ? Color(0xFF202449) : Colors.white;
    Color colorText =
        widget.colorText == 'white' ? Colors.white : Color(0xFF202449);
    return Transform.translate(
      offset: Offset(0, -30), // Geser ke atas sebanyak 2 piksel
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0).copyWith(right: 0),
        child: Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: MediaQuery.of(context).size.height *
                  0.13, // Sesuaikan dengan kebutuhan Anda
              width: MediaQuery.of(context).size.width *
                  0.45, // Sesuaikan dengan kebutuhan Anda
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1.0,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      widget.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        widget.label_1,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorText, // Ubah warna sesuai kebutuhan
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        widget.label_2,
                        style: TextStyle(
                          fontSize: 35,
                          color: colorText, // Ubah warna sesuai kebutuhan
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
