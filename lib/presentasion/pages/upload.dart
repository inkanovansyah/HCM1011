import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:hcm1011/presentasion/widgets/menunavigasi/menu.dart';
import 'package:hcm1011/data/service/api_sand_foto.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/data/service/api_story.dart';
import 'package:image/image.dart' as img;

enum EnumCameraDescription {
  front,
  back,
}

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _NameState();
}

class _NameState extends State<Screen> {
  late List<CameraDescription> cameras;
  CameraController? cameraController;
  EnumCameraDescription cameraDescription = EnumCameraDescription.front;

  @override
  void initState() {
    super.initState();
    initCameras(); // Inisialisasi kamera saat aplikasi dimulai
  }

  Future<void> initCameras() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      // Memulai dengan kamera depan
      startCamera(cameraDescription);
    } else {
      print('No available cameras found.');
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController descController = TextEditingController();

  Future<void> _saveImageToStory(String imagePath, String description) async {
    try {
      File imageFile = File(imagePath);
      img.Image? image = img.decodeImage(imageFile.readAsBytesSync());
      if (image != null) {
        final img.Image orientedImage = img.bakeOrientation(image);
        final newImageFile =
            await imageFile.writeAsBytes(img.encodeJpg(orientedImage));

        DetailInfo apiService = DetailInfo();
        String result = await apiService.fetchDataDetail(newImageFile);
        Map<String, dynamic> resultMap = json.decode(result);
        String imageUrl = resultMap['data']['image']['small']['source_url'];

        InsertStory apiStory = InsertStory();
        String res = await apiStory.fetchStoryApi(imageUrl, description);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MenuNavigasi(imagePath: newImageFile.path),
          ),
        );
      }
    } catch (e) {
      print('Error during API call or navigation: $e');
    }
  }

  Future<void> startCamera(EnumCameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController!.dispose();
    }

    CameraDescription selectedCamera;
    if (cameraDescription == EnumCameraDescription.front) {
      selectedCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras[0],
      );
    } else {
      selectedCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras[0],
      );
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

  void switchCamera() {
    if (cameraDescription == EnumCameraDescription.front) {
      setState(() {
        cameraDescription = EnumCameraDescription.back;
      });
    } else {
      setState(() {
        cameraDescription = EnumCameraDescription.front;
      });
    }
    startCamera(cameraDescription); // Mengganti kamera
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
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_sharp),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.switch_camera),
              onPressed: switchCamera, // Tombol untuk mengganti kamera
            ),
          ],
        ),
        backgroundColor: Color(0xffEEF2FD),
        body: ListView(
          children: [
            Column(
              children: [
                if (cameraController != null &&
                    cameraController!.value.isInitialized)
                  Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, // Sesuaikan dengan lebar layar
                    height: MediaQuery.of(context).size.width *
                        cameraController!
                            .value.aspectRatio, // Sesuaikan tinggi kamera
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(
                          cameraDescription == EnumCameraDescription.front
                              ? 3.14159
                              : 0.0), // Efek mirror untuk kamera depan
                      child: CameraPreview(cameraController!),
                    ),
                  )
                else
                  SizedBox(
                    height: 300, // Placeholder ukuran sementara
                    child: Center(
                      child: CircularProgressIndicator(), // Indikator loading
                    ),
                  ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Item/Keterangan',
                          style: openSensBoldDark.copyWith(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: descController,
                          decoration: InputDecoration(
                            labelText: 'Item/Keterangan',
                            fillColor: Colors.grey[200],
                            filled: true,
                            prefixIcon: Icon(Icons.description),
                            border: InputBorder.none,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Wajib diisi';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      if (cameraController != null &&
                          cameraController!.value.isInitialized) {
                        final XFile? imageFile =
                            await cameraController!.takePicture();
                        if (imageFile != null) {
                          String description = descController.text;

                          // Tampilkan modal setelah berhasil mengambil foto
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Foto Berhasil Diambil'),
                                content: Text(
                                    'Foto berhasil diambil dan akan disimpan.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Tutup modal
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );

                          // Tunggu selama 4 detik sebelum berpindah halaman
                          Future.delayed(Duration(seconds: 4), () {
                            Navigator.of(context).pop(); // Tutup modal otomatis
                            _saveImageToStory(imageFile.path,
                                description); // Simpan dan pindah ke halaman berikutnya
                          });
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
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Icon(
                        Icons.camera,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
