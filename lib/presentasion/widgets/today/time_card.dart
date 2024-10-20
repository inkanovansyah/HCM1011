import 'dart:io';
import 'dart:async';
import 'package:hcm1011/presentasion/widgets/today/latlang.dart';
import 'package:flutter/material.dart';
import 'package:hcm1011/data/service/geo.dart';
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:hcm1011/presentasion/widgets/face_recognition/face_recognition.dart';

Stream<String> getTimeStream() {
  return Stream.periodic(Duration(seconds: 1), (int _) {
    return DateFormat('HH:mm').format(DateTime.now());
  });
}

Stream<String> getDayStream() {
  return Stream.periodic(Duration(seconds: 1), (int _) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy | EEEE').format(now);
    return formattedDate;
  });
}

class CardTimeState extends StatelessWidget {
  final String imagePath;

  CardTimeState({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Padding di sekitar Card
          child: Container(
            color: Color(0xffEEF2FD),
            child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.all(10.0), // Padding di sekitar Card
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.all(0),
                    child: Container(
                      padding:
                          const EdgeInsets.all(10.0), // Padding di dalam Card
                      width:
                          double.infinity, // Agar card mengisi lebar container
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          imagePath.isNotEmpty
                              ? Center(
                                  child: Container(
                                    width: 320,
                                    height: 400,
                                    child: Image.file(
                                      File(imagePath),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CameraPage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 300,
                                    width: 320,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 126, 148, 220),
                                        width: 3,
                                      ),
                                      color: Color(0xFFEEF2FD),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add,
                                            size: 40,
                                            color: Colors.black,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Ambil Foto',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(height: 20),
                          LatLeng(),
                          SizedBox(height: 20),
                          StreamBuilder<String>(
                            stream: getTimeStream(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!,
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Text(
                                  'Loading...', // Teks yang ditampilkan saat loading
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                );
                              }
                            },
                          ),
                          SizedBox(height: 10),
                          StreamBuilder<String>(
                            stream: getDayStream(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                );
                              } else {
                                return Text(
                                  'Loading...', // Teks yang ditampilkan saat loading
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                );
                              }
                            },
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 320,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _uploadImage(context);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 35),
                                    child: Text('Clock in'),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF202449),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 0,
                                    minimumSize: Size(320,
                                        50), // Sesuaikan tinggi sesuai kebutuhan
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _uploadImage(BuildContext context) async {
    if (imagePath.isNotEmpty) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Sedang mengirim data...'),
              ],
            ),
          );
        },
      );

      Atandance attendance = Atandance();
      try {
        String uploadResult = await attendance.uploadImage(File(imagePath));

        print('data = ${uploadResult}');

        Map<String, dynamic> resultMap = json.decode(uploadResult);
        String stringValue = resultMap['data']['attendance']['face-recognition']
            ['msg']; // Nilai yang didapat dari response

        Navigator.pop(context); // Tutup dialog ketika pengunggahan selesai

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              content: Container(
                width: MediaQuery.of(context).size.width *
                    0.8, // Atur lebar sesuai kebutuhan
                height: 300.00, // Atur tinggi sesuai kebutuhan
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/modal.png', // Ganti dengan path gambar aset yang sebenarnya
                      width: 150, // Sesuaikan lebar gambar
                      height: 150, // Sesuaikan tinggi gambar
                    ),
                    SizedBox(height: 20),
                    Text(
                      'wajah uploaded dan $stringValue',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15), // Atur jarak sesuai kebutuhan
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              darkdarkBlueColor, // Warna latar belakang
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10), // Atur padding
                        ),
                        child: Text(
                          'Tutup',
                          style:
                              TextStyle(fontSize: 16), // Sesuaikan ukuran teks
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );

        // Jika ingin navigasi ke layar baru setelah pengungahan berhasil
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => NewScreen(), // Ganti dengan layar baru yang diinginkan
        //   ),
        // );
      } catch (e) {
        print('Error uploading image: $e');

        Navigator.pop(context); // Tutup dialog jika terjadi kesalahan

        // Tindakan jika terjadi kesalahan saat pengunggahan gambar
      }
    } else {
      // Logika ketika tidak ada foto yang dipilih
    }
  }
}
