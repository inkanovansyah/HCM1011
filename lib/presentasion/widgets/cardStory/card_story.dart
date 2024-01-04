import 'package:flutter/material.dart';

class cardStory extends StatefulWidget {
  final String img;

  cardStory({
    required this.img,
  });

  @override
  State<cardStory> createState() => _stateStory();
}

class _stateStory extends State<cardStory> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 10),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        // Use a Stack to overlay cards
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 310,
                height: 438,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Mengatur radius
                  image: DecorationImage(
                    image: AssetImage(widget.img),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: 6,
            right: 6,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50, // Ukuran gambar bulat
                      height: 50, // Ukuran gambar bulat
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Membuat gambar bulat
                        image: DecorationImage(
                          image: AssetImage(widget.img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.00), // Spasi antara gambar dan teks
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rudi Tabuty',
                          style: TextStyle(
                            fontSize: 16.00,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5), // Spasi antara teks dan tanggal
                        Text(
                          '1 January, 2024', // Ganti dengan tanggal yang diinginkan
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey, // Warna teks tanggal
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
