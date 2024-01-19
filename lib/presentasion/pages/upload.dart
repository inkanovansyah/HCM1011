import 'package:flutter/material.dart';

import 'dart:async';
import 'package:camera/camera.dart';
import 'package:hcm1011/presentasion/pages/dashboard.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

enum EnumCameraDescription {
  front,
  back,
}

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _nameState();
}

class _nameState extends State<screen> {
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
        appBar: AppBar(
          backgroundColor: darkdarkBlueColor,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            'Move and Scale',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_sharp),
            onPressed: () {
              Navigator.of(context).pop(); // Navigate back to the previous page
            },
          ), // Menghilangkan tombol back
        ),
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
              bottom: 15,
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
                            builder: (context) => Dashboard(),
                          ),
                        );
                      } catch (e) {
                        print('Error during navigation: $e');
                      }
                    }
                  },
                  child: Container(
                    width: 80,
                    height: 80,
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
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
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
                          title: Text('How to Take Selfie'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Express yourself and take a photo',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
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
                                        primary: Color(0xFF202449),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        elevation: 0,
                                        minimumSize: Size(320, 50),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Material(
                    elevation: 2, // Adjust the elevation value as needed
                    shape: CircleBorder(),
                    color: Colors.white,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.help_outline,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
