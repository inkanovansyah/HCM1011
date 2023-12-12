import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

// import 'package:url_launcher/url_launcher.dart';
import 'package:hcm1011/presentasion/widgets/face_recognition/face_recognition.dart';

class TimeCard extends StatefulWidget {
  @override
  State<TimeCard> createState() => _CardTimeState();
}

class _CardTimeState extends State<TimeCard> {
  String? _imagePath; // Variable to store the image path
  late LatLng _currentLocation; // Declare _currentLocation as late

  @override
  void initState() {
    super.initState();
    _currentLocation = LatLng(0, 0); // Initialize with default values
    getLocation(); // Fetch the location when the widget initializes
  }

  Future<void> getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Handle if permission is denied
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });
      print(
          'Latitude: ${_currentLocation.latitude}, Longitude: ${_currentLocation.longitude}');
    } catch (e) {
      print('Error fetching location: $e'); // Error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffEEF2FD),
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: FlutterMap(
                  options: MapOptions(
                    center:
                        //
                        LatLng(-6.1155323251308396, 106.78905865835308),
                    zoom: 18.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 50.0,
                          height: 50.0,
                          point:
                              // _currentLocation,
                              LatLng(-6.1155323251308396, 106.78905865835308),
                          builder: (ctx) => Container(
                              child: Image.asset(
                            'assets/images/pin-map.png', // Ganti dengan path gambar Anda
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit
                                .cover, // Sesuaikan dengan kebutuhan tampilan gambar
                          )),
                        ),
                        // Tambahkan marking lain jika diperlukan
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 464,
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
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xff202449),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          height: 37,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '09:43',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                  width: 5), // Memberikan jarak antara teks
                              Text(
                                '29 Oktober 2022',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Thusdey',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 16,
                                ),
                              ),
                              // Add more Text widgets as needed
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lokasi',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width - 10,
                                height: 50,
                                color: Colors.amber[400],
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                    ), // Ganti dengan ikon yang sesuai
                                    SizedBox(
                                        width:
                                            10), // Memberikan jarak antara ikon dan teks
                                    Text(
                                      'Alamat Anda',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cara Mengambil Foto',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
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
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CameraPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 100,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Color(0xFF405AAD),
                                      width: 3,
                                    ),
                                    color: Color(0xFFD0D9F3),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 40,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Do something
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 35),
                                      child: Text('Clock in'),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF202449),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 0,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Do something else
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 35),
                                      child: Text(
                                        'Clock Out',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFFF5F5F5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 0, //
                                    ),
                                  ),
                                ],
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
}
