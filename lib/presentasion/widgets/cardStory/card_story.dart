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
              Image.asset(
                widget.img,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Positioned(
            // Position the nested Card
            bottom: 10,
            left: 4,
            right: 4,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Comming Son',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
