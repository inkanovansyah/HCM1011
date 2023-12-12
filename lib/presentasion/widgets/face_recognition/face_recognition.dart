import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'dart:io'; // Import dart:io

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
    Size screenSize = MediaQuery.of(context).size;
    if (cameraController?.value.isInitialized == true) {
      return Scaffold(
        body: Stack(
          children: [
            GestureDetector(
              onTap: () async {
                final XFile? imageFile = await cameraController!.takePicture();
                if (imageFile != null) {
                  _saveImageToTimeCard(
                      imageFile.path); // Pass image path to TimeCard
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImageView(
                        imagePath: imageFile.path,
                      ),
                    ),
                  );
                }
              },
              child: RotatedBox(
                quarterTurns: 0, // Rotasi 90 derajat (mode potret)
                child: ClipRect(
                  child: OverflowBox(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
                      child: SizedBox(
                        width: screenSize.width,
                        height: screenSize.height,
                        child: CameraPreview(cameraController!),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  direction = direction == 0
                      ? 1
                      : 0; // Toggle antara kamera depan dan belakang
                  final newCameraDescription = direction == 0
                      ? EnumCameraDescription.front
                      : EnumCameraDescription.back;
                  startCamera(
                      newCameraDescription); // Memulai kamera yang baru dipilih
                });
              },
            ),
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
                child: GestureDetector(
                  onTap: () async {
                    final XFile? imageFile =
                        await cameraController!.takePicture();
                    if (imageFile != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenImageView(
                            imagePath: imageFile.path,
                          ),
                        ),
                      );
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
          ],
        ),
      );
    } else {
      return const SizedBox(); // Tampilkan kontainer kosong jika kamera belum diinisialisasi
    }
  }
}

class FullScreenImageView extends StatelessWidget {
  final String imagePath;

  FullScreenImageView({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.file(
            File(imagePath), // Memuat dan menampilkan gambar yang diambil
            fit: BoxFit.fill, // Memastikan gambar menutupi seluruh layar
          ),
        ),
      ),
    );
  }
}
