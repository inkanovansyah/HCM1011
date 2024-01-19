import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';
import 'package:hcm1011/presentasion/pages/upload.dart';

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  State<AddButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: 180, // Lebar tombol 180 pixel
          child: MaterialButton(
            elevation: 0,
            height: 50,
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      screen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
            color: darkdarkBlueColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons
                      .add_circle_outline_rounded, // Replace with the desired icon
                  color: Colors.white,
                ),
                SizedBox(width: 4), // 2-pixel gap
                Text(
                  'Add Story',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
