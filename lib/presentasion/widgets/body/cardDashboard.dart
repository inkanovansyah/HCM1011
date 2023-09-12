import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class cardSchedule extends StatefulWidget {
  // const cardSchedule({super.key});
  final String label_1;
  final String label_2;
  final String label_3;
  final String img;

  cardSchedule({
    required this.label_1,
    required this.label_2,
    required this.label_3,
    required this.img,
  });

  @override
  State<cardSchedule> createState() => _cardSchedule();
}

class _cardSchedule extends State<cardSchedule> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 90,
            width: 159,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 50, // Ubah tinggi sesuai kebutuhan
                  width: 50, // Ubah lebar sesuai kebutuhan
                  child: Image.asset(
                    widget.img,
// Sesuaikan mode tampilan gambar sesuai kebutuhan
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
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
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.0), // Atur padding kiri sesuai kebutuhan
                      child: Text(
                        widget.label_2,
                        style: openSensMediumDark.copyWith(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.left,
                      ),
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
