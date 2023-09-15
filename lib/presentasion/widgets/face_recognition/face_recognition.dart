import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
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

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'assets/images/image_0.png',
      'assets/images/image_1.png',
      'assets/images/image_2.png',
      'assets/images/image_3.png',
    ];
    if (cameraController?.value.isInitialized == true) {
      return Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                final XFile? imageFile = await cameraController!.takePicture();
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
              child: RotatedBox(
                quarterTurns: 0, // Rotasi 90 derajat (mode potret)
                child: AspectRatio(
                  aspectRatio: 4 / 5,
                  child: CameraPreview(cameraController!),
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
                          490, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
                      fit: BoxFit
                          .cover, // Sesuaikan dengan kebutuhan tampilan gambar
                    ),
                  ),
                ],
              ),
            ), //belom tau masih ambigu
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 10,
                      top: 510,
                      left: 20), // Tambahkan jarak kanan dan atas
                  child: Text(
                    'Attendance Info',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: darkblueColor,
                    ),
                  ),
                ),
                SizedBox(height: 2),
                Container(
                  height: 120, // Tinggi gambar
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal, // Geser ke samping
                    itemCount: imagePaths.length,
                    itemBuilder: (BuildContext context, int index) {
                      String imagePath = imagePaths[index];
                      return Padding(
                        padding:
                            const EdgeInsets.all(18.0), // Jarak antara gambar
                        child: Column(
                          children: [
                            Container(
                              width: 80, // Lebar gambar
                              height: 80, // Tinggi gambar
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(imagePath), // Path gambar
                                  fit: BoxFit
                                      .cover, // Sesuaikan dengan kebutuhan Anda
                                ),
                              ),
                            ), // Tambahkan judul di bawah gambar
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
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
