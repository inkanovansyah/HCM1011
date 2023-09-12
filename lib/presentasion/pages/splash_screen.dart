import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/pages/login.dart';
import 'package:introduction_screen/introduction_screen.dart';

class splash_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 23),
        bodyPadding: EdgeInsets.all(30));
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
            title: 'Pengenalan HCM',
            body:
                'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla',
            image: Image.asset(
              'assets/images/onboarding.png',
              width: 200,
            ),
            decoration: pageDecoration),
        PageViewModel(
            title: 'Pengenalan HCM',
            body:
                'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla',
            image: Image.asset(
              'assets/images/onboarding.png',
              width: 200,
            ),
            decoration: pageDecoration),
        PageViewModel(
          title: 'Pengenalan HCM',
          body:
              'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla',
          image: Image.asset(
            'assets/images/onboarding.png',
            width: 200,
          ),
          decoration: pageDecoration,
        )
      ],
      onDone: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => login(),
          ),
        );
      },
      showSkipButton: true,
      showNextButton: true,
      showDoneButton: true,
      showBackButton: false,
      dotsFlex: 3,
      nextFlex: 1,
      skipOrBackFlex: 1,
      back: Icon(Icons.arrow_back),
      skip: Text('Skip', style: TextStyle(fontWeight: FontWeight.bold)),
      next: Icon(Icons.arrow_forward),
      done: Text('Lanjut', style: TextStyle(fontWeight: FontWeight.bold)),
      dotsDecorator: DotsDecorator(
        size: Size(10.00, 10.00),
        color: Colors.grey,
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
