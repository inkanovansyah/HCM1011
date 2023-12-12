import 'package:geolocator/geolocator.dart';

// Fungsi untuk mendapatkan lokasi saat ini
Future<void> getLocation() async {
  LocationPermission permission = await Geolocator.requestPermission();

  if (permission == LocationPermission.denied) {
    // Handle jika izin ditolak
    return;
  }

  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  // Dapatkan nilai latitude dan longitude dari 'position'
  double latitude = position.latitude;
  double longitude = position.longitude;

  // Lakukan sesuatu dengan nilai latitude dan longitude yang didapat
  print('Latitude: $latitude, Longitude: $longitude');
}
