import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LatLeng extends StatefulWidget {
  const LatLeng({Key? key}) : super(key: key);

  @override
  State<LatLeng> createState() => _LatLengState();
}

class _LatLengState extends State<LatLeng> {
  Future<String> _getAddressFromCoordinates() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        throw 'Location permission denied';
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks.first;
      String address =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

      return address;
    } catch (e) {
      return 'Failed to fetch address: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getAddressFromCoordinates(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
          );
        } else if (snapshot.hasData) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFD0D9F3),
            ),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                children: [
                  SizedBox(width: 4),
                  Icon(
                    Icons.add_location_sharp,
                    color: Color(0xFF202449),
                    size: 24,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Center(
                      child: Text(
                        snapshot.data!,
                        style: TextStyle(
                          color: Color(0xFF202449),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text(
              'Alamat tidak tersedia',
              style: TextStyle(
                color: Color(0xFF202449),
                fontSize: 16,
              ),
            ),
          );
        }
      },
    );
  }
}
