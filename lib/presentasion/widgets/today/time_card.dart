import 'dart:io';
import 'dart:async';
import 'package:hcm1011/presentasion/widgets/today/latlang.dart';
import 'package:flutter/material.dart';
import 'package:hcm1011/data/service/geo.dart';

import 'package:intl/intl.dart';

// import 'package:url_launcher/url_launcher.dart';
import 'package:hcm1011/presentasion/widgets/face_recognition/face_recognition.dart';

// class TimeCard extends StatefulWidget {
//   final String imagePath;

//   TimeCard({required this.imagePath});
//   @override
//   State<TimeCard> createState() => _CardTimeState();
// }

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
        child: Container(
          color: Color(0xffEEF2FD),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              // SizedBox(
              //   height: 80,
              //   child: FlutterMap(
              //     options: MapOptions(
              //       center:
              //           //
              //           LatLng(-6.1155323251308396, 106.78905865835308),
              //       zoom: 18.0,
              //     ),
              //     children: [
              //       TileLayer(
              //         urlTemplate:
              //             'http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
              //         userAgentPackageName: 'com.example.app',
              //       ),
              //       MarkerLayer(
              //         markers: [
              //           Marker(
              //             width: 50.0,
              //             height: 50.0,
              //             point:
              //                 // _currentLocation,
              //                 LatLng(-6.1155323251308396, 106.78905865835308),
              //             builder: (ctx) => Container(
              //                 child: Image.asset(
              //               'assets/images/pin-map.png', // Ganti dengan path gambar Anda
              //               width: 50.0,
              //               height: 50.0,
              //               fit: BoxFit
              //                   .cover, // Sesuaikan dengan kebutuhan tampilan gambar
              //             )),
              //           ),
              //           // Tambahkan marking lain jika diperlukan
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 0.0, left: 20.0, right: 20.0, bottom: 20.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.all(0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              // SizedBox(height: 10),
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text(
                              //       'Lokasi',
                              //       style: TextStyle(
                              //         fontWeight: FontWeight.bold,
                              //         fontSize: 16,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(height: 10),
                              // Container(
                              //   width: MediaQuery.of(context).size.width - 10,
                              //   height: 50,
                              //   color: Colors.amber[400],
                              //   child: Row(
                              //     children: [
                              //       SizedBox(
                              //         width: 10,
                              //       ),
                              //       Icon(
                              //         Icons.location_on,
                              //         color: Colors.red,
                              //       ), // Ganti dengan ikon yang sesuai
                              //       SizedBox(
                              //           width:
                              //               10), // Memberikan jarak antara ikon dan teks
                              //       Text(
                              //         'Alamat Anda',
                              //         style: TextStyle(fontSize: 12),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // SizedBox(height: 20),
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text(
                              //       'Cara Mengambil Foto',
                              //       style: TextStyle(
                              //         fontWeight: FontWeight.bold,
                              //         fontSize: 16,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(height: 10),
                              // Container(
                              //   width: 300,
                              //   height: 90,
                              //   child: _imagePath != null
                              //       ? Image.file(
                              //           File(
                              //               _imagePath!), // Ensure you're importing dart:io and use File correctly
                              //           width: 300,
                              //           height: 90,
                              //           fit: BoxFit.cover,
                              //         )
                              //       : Image.asset(
                              //           'assets/images/ambil_foto.png',
                              //           width: 300,
                              //           height: 90,
                              //           fit: BoxFit.cover,
                              //         ),
                              // ),
                              SizedBox(height: 10),
                              imagePath != null && imagePath.isNotEmpty
                                  ? Center(
                                      child: Container(
                                        width: 320,
                                        height: 400,
                                        child: Image.file(
                                          File(imagePath!),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 126, 148, 220),
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
                                              SizedBox(
                                                  height:
                                                      10), // Spasi antara ikon dan teks
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        primary: Color(0xFF202449),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        elevation: 0,
                                        minimumSize: Size(320,
                                            50), // Sesuaikan tinggi sesuai kebutuhan
                                      ),
                                    ),
                                  ),

                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     // Do something else
                                  //   },
                                  //   child: Padding(
                                  //     padding: EdgeInsets.symmetric(
                                  //         vertical: 15, horizontal: 35),
                                  //     child: Text(
                                  //       'Clock Out',
                                  //       style: TextStyle(
                                  //         color: Colors.black,
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   style: ElevatedButton.styleFrom(
                                  //     primary: Color(0xFFF5F5F5),
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.circular(10),
                                  //     ),
                                  //     elevation: 0, //
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _uploadImage(BuildContext context) async {
    if (imagePath != null && imagePath.isNotEmpty) {
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
        print('${uploadResult}');

        Navigator.pop(context); // Tutup dialog ketika pengunggahan selesai

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image uploaded successfully'),
          ),
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
