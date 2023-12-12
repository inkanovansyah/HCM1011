import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class trainings extends StatefulWidget {
  final String title;
  final String date;
  final String review;
  final String imgprofile;
  final String imgcover;

  trainings({
    required this.title,
    required this.date,
    required this.review,
    required this.imgprofile,
    required this.imgcover,
  });
  @override
  State<trainings> createState() => _infotrainings();
}

class _infotrainings extends State<trainings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffEEF2FD),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 360,
                  width: 340,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                      width: 4.0,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              widget.imgprofile,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  widget.title,
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
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  widget.date,
                                  style: openSensMediumDark.copyWith(
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width:
                                30, // Tambahkan jarak horizontal antara title dan ikon titik tiga
                          ),
                          PopupMenuButton(
                            icon: Icon(
                              Icons.more_vert, // Icon titik tiga (ellipsis)
                              color: Colors
                                  .black, // Ganti warna sesuai keinginan Anda
                            ),
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem(
                                  child: Text('Join'),
                                  value: 'item1',
                                ),
                                PopupMenuItem(
                                  child: Text('G dulu'),
                                  value: 'item2',
                                ),
                                // Tambahkan item dropdown lainnya sesuai kebutuhan
                              ];
                            },
                            onSelected: (value) {
                              // Handler ketika item dropdown dipilih
                              if (value == 'item1') {
                                _showSimpleDialog();
                                // Lakukan sesuatu untuk item 1
                              } else if (value == 'item2') {
                                // Lakukan sesuatu untuk item 2
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              widget.review,
                              style: openSensMediumDark.copyWith(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left:
                                    10.0), // Tambahkan padding kiri sebesar 10 piksel
                            child: Container(
                              height: 240,
                              width: 340,
                              child: Image.asset(
                                widget.imgcover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSimpleDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SimpleDialog(
              title: Center(
                child: Text('Are you sure?'),
              ),
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: SizedBox(
                    width: 240, // Lebar tombol 180 pixel
                    child: MaterialButton(
                      elevation: 0,
                      height: 50,
                      onPressed: () {
                        // Tambahkan fungsi yang akan dijalankan ketika tombol ditekan
                      },
                      color: darkdarkBlueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Join Training',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      textColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: SizedBox(
                    width: 240, // Lebar tombol 180 pixel
                    child: MaterialButton(
                      elevation: 0,
                      height: 50,
                      onPressed: () {
                        // Tambahkan fungsi yang akan dijalankan ketika tombol ditekan
                      },
                      color: grayColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Not Now',
                        style:
                            TextStyle(color: darkdarkBlueColor, fontSize: 16),
                      ),
                      textColor: darkdarkBlueColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
