import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:image/image.dart' as img;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm1011/presentasion/widgets/today/latlang.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:hcm1011/data/service/geo.dart';
import 'package:intl/intl.dart';
import 'package:hcm1011/presentasion/bloc/bloc_attandance/bloc_attandance_bloc.dart';
import 'package:hcm1011/presentasion/widgets/face_recognition/face_recognition.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:geolocator/geolocator.dart';

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

Future<void> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    // Jika perangkat Android
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.model}'); // Cetak model perangkat
    print('Android Version: ${androidInfo.version.release}'); // Versi Android
    print('Manufacturer: ${androidInfo.manufacturer}'); // Produsen perangkat
  } else if (Platform.isIOS) {
    // Jika perangkat iOS
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    print('Running on ${iosInfo.utsname.machine}'); // Nama perangkat
    print('iOS Version: ${iosInfo.systemVersion}'); // Versi iOS
  }
}

class CardTimeState extends StatelessWidget {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController source = TextEditingController();
  final TextEditingController lat = TextEditingController();
  final TextEditingController long = TextEditingController();
  final TextEditingController location = TextEditingController();
  final String imagePath;

  CardTimeState({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlocAttandanceBloc, BlocAttandanceState>(
      listener: (context, state) {
        if (state is BlocAttandanceLoaded) {
          // Tutup dialog loading dan tampilkan modal kesuksesan
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                content: IntrinsicHeight(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/modal.png', // Ganti dengan gambar kesuksesan Anda
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Attendance submitted successfully!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              );
            },
          );

          // Tutup modal setelah 3 detik
          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pop(); // Tutup modal kesuksesan
          });
        } else if (state is BlocAttandanceError) {
          // Tutup dialog loading dan tampilkan modal kesalahan
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                content: IntrinsicHeight(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/modal.png', // Ganti dengan gambar kesalahan Anda
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Failed to submit attendance: ${state.messages}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              );
            },
          );

          // Tutup modal setelah 3 detik
          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pop(); // Tutup modal kesalahan
          });
        }
      },
      child: Scaffold(
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
                        width: double
                            .infinity, // Agar card mengisi lebar container
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
                            LatLeng(
                              onAddressRetrieved: (String address) {
                                location.text = address;
                              },
                            ),
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
                                      minimumSize: Size(320, 50),
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
      ),
    );
  }

  Future<bool> isWithinRadius(
      double targetLat, double targetLong, double radiusInMeters) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    double distanceInMeters = Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      targetLat,
      targetLong,
    );

    return distanceInMeters <= radiusInMeters;
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

      // Load the image file
      File sourceFile = File(imagePath);
      img.Image? originalImage = img.decodeImage(sourceFile.readAsBytesSync());

      if (originalImage != null) {
        // Flip the image if needed to avoid mirroring
        img.Image correctedImage = img.flipHorizontal(originalImage);

        // Save the corrected image as a new file
        final correctedImagePath =
            '${sourceFile.parent.path}/corrected_${sourceFile.uri.pathSegments.last}';
        File(correctedImagePath)
            .writeAsBytesSync(img.encodeJpg(correctedImage));

        // Use the corrected image path for further processing or upload
        Atandance attendance = Atandance();
        try {
          String uploadResult =
              await attendance.uploadImage(File(correctedImagePath));

          Map<String, dynamic> resultMap = json.decode(uploadResult);
          String stringValue =
              resultMap['data']['attendance']['face-recognition']['msg'];
          String lat = resultMap['data']['attendance']['location']['lat'];
          String long = resultMap['data']['attendance']['location']['long'];
          String source = resultMap['data']['images']['original']['source_url'];
          String nikResponse = resultMap['data']['attendance']['nik'];

          SharedPreferences prefs = await SharedPreferences.getInstance();
          String? nikSharedPreferences = prefs.getString('nik');

          Navigator.pop(context); // Close loading dialog

          if (nikResponse == nikSharedPreferences) {
            if (location.text.isEmpty) {
              print('Location is empty, cannot submit attendance.');
            } else {
              context.read<BlocAttandanceBloc>().add(
                    AddAttandanceSubmit(
                      source: source,
                      lat: lat,
                      long: long,
                      location: location.text,
                    ),
                  );
            }
            // Success message dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  content: IntrinsicHeight(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/modal.png',
                            width: 150,
                            height: 150,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'face uploaded dan $stringValue',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            // Handle mismatched face error
            showDialog(
              context: context,
              builder: (BuildContext context) {
                Future.delayed(Duration(seconds: 3), () {
                  Navigator.of(context).pop();
                });
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  content: IntrinsicHeight(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/modal.png',
                            width: 150,
                            height: 150,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Face mismatch detected. Please verify your attendance with your own face.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        } catch (e) {
          print('Error uploading image: $e');
          Navigator.pop(context);
        }
      } else {
        print("Error processing image.");
        Navigator.pop(context);
      }
    }
  }
}
