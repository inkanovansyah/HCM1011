import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class leaveW extends StatefulWidget {
  // const leaveW({super.key});
  final String label_1;
  final String label_2;
  final String label_3;
  final String label_4;
  final String leave;
  final String status;
  final String durasi;
  final String note;

  leaveW({
    required this.label_1,
    required this.label_2,
    required this.label_3,
    required this.label_4,
    required this.leave,
    required this.status,
    required this.durasi,
    required this.note,
  });

  @override
  State<leaveW> createState() => _leaveState();
}

class _leaveState extends State<leaveW> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 0.0, // Menghilangkan bayangan dengan mengatur elevation ke 0
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Mengatur border radius
          side: BorderSide(
            color: const Color.fromARGB(
                255, 216, 216, 216), // Mengatur warna border
            width: 1.0, // Mengatur lebar border
          ),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 190,
            width: 156,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  height: 5,
                  decoration: BoxDecoration(
                    color: darkdarkBlueColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3),
                      topRight: Radius.circular(3),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    ClipOval(
                      child: Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/Profile.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.label_1,
                            style: poppinsMediumDark.copyWith(
                              fontSize: 16,
                              color: darkdarkBlueColor,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            widget.leave,
                            style: poppinsMediumDark.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: darkdarkBlueColor,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.label_2,
                            style: poppinsMediumDark.copyWith(
                              fontSize: 16,
                              color: darkdarkBlueColor,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical:
                                    4), // Sesuaikan padding sesuai kebutuhan
                            decoration: BoxDecoration(
                              color: Colors
                                  .green, // Warna latar belakang badge (hijau dalam hal ini)
                              borderRadius: BorderRadius.circular(
                                  10), // Sesuaikan bentuk badge sesuai kebutuhan
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  widget.status,
                                  style: poppinsMediumDark.copyWith(
                                    fontSize: 17,
                                    color: Colors
                                        .white, // Warna teks pada badge (putih dalam hal ini)
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 53,
                    ),
                    SizedBox(width: 20),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.label_3,
                            style: poppinsMediumDark.copyWith(
                              fontSize: 16,
                              color: darkdarkBlueColor,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            widget.durasi,
                            style: poppinsMediumDark.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: darkdarkBlueColor,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    // Tombol Edit
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Tambahkan logika yang sesuai untuk meng-handle edit
                      },
                    ),
                    // Tombol Delete
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Tambahkan logika yang sesuai untuk meng-handle delete
                      },
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
