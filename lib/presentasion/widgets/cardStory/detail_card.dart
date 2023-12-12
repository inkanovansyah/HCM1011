import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class CardDetail extends StatefulWidget {
  final String judul;
  final String tanggal;
  final String data;
  final String profile;
  final String cover;

  CardDetail({
    required this.judul,
    required this.tanggal,
    required this.data,
    required this.profile,
    required this.cover,
  });

  @override
  State<CardDetail> createState() => _cardinfoState();
}

class _cardinfoState extends State<CardDetail> {
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
                              widget.judul,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  widget.tanggal,
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
                                  widget.data,
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
                              widget.profile,
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
                                widget.cover,
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
