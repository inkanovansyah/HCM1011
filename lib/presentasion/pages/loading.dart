import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 100,
              height: 100,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
