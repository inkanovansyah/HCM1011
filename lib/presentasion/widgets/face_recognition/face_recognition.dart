import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/pages/my_attandance.dart';

import 'dart:async';

enum EnumCameraDescription {
  front,
  back,
}

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> cameras;
  CameraController? cameraController;
  int direction = 0; // Variabel untuk mengatur arah kamera

  @override
  void initState() {
    super.initState();
    startCamera(EnumCameraDescription.front); // Memulai dengan kamera depan
  }

  Future<void> startCamera(EnumCameraDescription cameraDescription) async {
    cameras = await availableCameras();

    cameraController?.dispose();

    CameraDescription selectedCamera;

    switch (cameraDescription) {
      case EnumCameraDescription.front:
        selectedCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
          orElse: () => cameras[
              0], // Default ke kamera pertama jika kamera depan tidak tersedia
        );
        break;
      case EnumCameraDescription.back:
        selectedCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back,
          orElse: () => cameras[
              0], // Default ke kamera pertama jika kamera belakang tidak tersedia
        );
        break;
    }

    cameraController = CameraController(
      selectedCamera,
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

    try {
      await cameraController!.initialize();
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  void _saveImageToTimeCard(String imagePath) {
    Navigator.pop(context, imagePath); // Return image path to previous screen
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController?.value.isInitialized == true) {
      return Scaffold(
        body: Stack(
          children: [
            Center(
              child: OverflowBox(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width *
                        cameraController!.value.aspectRatio,
                    child: CameraPreview(cameraController!),
                  ),
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     setState(() {
            //       direction = direction == 0
            //           ? 1
            //           : 0; // Toggle antara kamera depan dan belakang
            //       final newCameraDescription = direction == 0
            //           ? EnumCameraDescription.front
            //           : EnumCameraDescription.back;
            //       startCamera(
            //           newCameraDescription); // Memulai kamera yang baru dipilih
            //     });
            //   },
            // ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Image.asset(
                      'assets/images/imageface.png', // Ganti dengan path gambar yang sesuai
                      width:
                          430, // Sesuaikan lebar gambar sesuai kebutuhan Anda
                      height:
                          900, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
                      fit: BoxFit
                          .cover, // Sesuaikan dengan kebutuhan tampilan gambar
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: InkWell(
                  onTap: () async {
                    final XFile? imageFile =
                        await cameraController!.takePicture();
                    print('erorr bang ${imageFile?.path}');
                    if (imageFile != null) {
                      try {
                        // Langsung pindah ke halaman berikutnya tanpa menunggu gesture
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MyAttandance(imagePath: imageFile.path),
                          ),
                        );
                      } catch (e) {
                        print('Error during navigation: $e');
                      }
                    }
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(
                        startAngle: 0.0,
                        endAngle: 2 * 3.1415,
                        colors: [
                          Color(0xFF1BEFC7),
                          Color(0xFFF993E5),
                          Color(0xFFFFF1CA),
                          Color(0xFF62F4F4),
                        ],
                      ),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.camera,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 290,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'How to Take Selfie',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight
                                      .bold, // This makes the text bold
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Make sure we can see clear features.',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Do natural expression and do not cover.',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'your face.',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 20),
                              Image.asset(
                                'assets/images/tutor_.png', // Ganti dengan path gambar Anda
                                width: 280,
                                height: 80,
                              ),
                              SizedBox(height: 20),
                              Text(
                                'It should be only you. Not too far or too.',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'close.',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 20),
                              Image.asset(
                                'assets/images/tutor_1.png', // Ganti dengan path gambar Anda
                                width: 280,
                                height: 80,
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 220,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 35),
                                        child: Text('OK, Got it!'),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF202449),
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
                                ],
                              ),
                            ],
                          ),
                          // actions: [
                          //   ButtonBar(
                          //     alignment: MainAxisAlignment.center,
                          //     mainAxisSize: MainAxisSize
                          //         .min, // Menyesuaikan lebar sesuai konten
                          //     children: [
                          //       ElevatedButton(
                          //         onPressed: () {
                          //           Navigator.of(context).pop();
                          //         },
                          //         child: Padding(
                          //           padding: EdgeInsets.symmetric(
                          //               horizontal:
                          //                   20), // Sesuaikan jarak horizontal
                          //           child: Text('OK, Got it!'),
                          //         ),
                          //         style: ElevatedButton.styleFrom(
                          //           primary:
                          //               Color(0xFF202449), // Ganti warna tombol
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ],
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.help_outline, // Mengubah ikon menjadi tanda tanya
                      color: Colors.black, // Mengubah warna ikon menjadi hitam
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox(); // Tampilkan kontainer kosong jika kamera belum diinisialisasi
    }
  }
}
