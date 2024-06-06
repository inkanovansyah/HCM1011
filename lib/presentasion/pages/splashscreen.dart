import 'package:flutter/material.dart';
import 'package:hcm1011/presentasion/pages/login.dart';

import 'package:hcm1011/presentasion/themes/global_themes.dart';

class SplashScreen extends StatefulWidget {
  static String route = "/main";
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<Widget> _pages = [
    OnboardingPage(
      image: 'assets/images/splash.png',
      text: 'Siapa Kita?Hero',
      label2: 'hero_1',
    ),
    OnboardingPage(
        image: 'assets/images/splash_1.png',
        text: 'HIGH GRIDE',
        label2: 'Individu dan hasil pekerjaan yang berkualitas'),
    OnboardingPage(
        image: 'assets/images/splash_2.png',
        text: 'ETHIC SENSE',
        label2: 'Individu yang memiliki etika dan moral'),
    OnboardingPage(
        image: 'assets/images/splash_3.png',
        text: 'RELIBLE',
        label2: 'Individu dan Produk yang dapat diandalkan'),
    OnboardingPage(
        image: 'assets/images/splash_4.png',
        text: 'OVERCOME',
        label2: 'Individu dan Perusahaan yang mau melampui pencapaiannya'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: (context, index) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: darkdarkBlueColor,
        child: Container(
          margin: EdgeInsets.only(bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  'Previous',
                  style:
                      TextStyle(color: Colors.white), // Set text color to white
                ),
              ),
              // Inside your _SplashScreenState build method
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      width: _currentPage == index
                          ? 15.0
                          : 10.0, // Adjust size based on current page
                      height: _currentPage == index
                          ? 15.0
                          : 10.0, // Adjust size based on current page
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: _currentPage == index
                            ? LinearGradient(
                                colors: [
                                  Color(0xff6BE4FF),
                                  Color(0xffB8F2FF),
                                ], // Gradient colors
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )
                            : null, // Set gradient for active page, null for inactive pages
                        color: _currentPage == index ? null : Colors.grey,
                      ),
                    );
                  },
                ),
              ),

              ElevatedButton(
                onPressed: _currentPage == _pages.length - 1
                    ? () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) => Login(),
                          ),
                        );
                      }
                    : () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.0), // Adjust padding as needed
                  primary:
                      Colors.transparent, // Set background color to transparent
                  onPrimary:
                      Colors.transparent, // Set overlay color to transparent
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _currentPage == _pages.length - 1
                        ? Text('Get Started',
                            style: TextStyle(color: Colors.white))
                        : Icon(
                            Icons
                                .arrow_forward_ios_rounded, // Use CupertinoIcons forward icon for iOS
                            color: Colors.white,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String text;
  final String label2;

  const OnboardingPage({
    required this.image,
    required this.text,
    required this.label2,
  });

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    Color? textColor;
    if (label2 == 'hero_1') {
      backgroundColor = Colors.white; // Set background color for the first page
      textColor = darkdarkBlueColor; // Set text color for the first page
    } else {
      backgroundColor =
          darkdarkBlueColor; // Set background color for other pages
      textColor = Colors.white; // Set text color for other pages
    }

    return Container(
      padding: EdgeInsets.all(20.0),
      color: backgroundColor, // Use the determined background color
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(image),
          SizedBox(height: 30.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            label2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor, // Set the text color
            ),
          ),
        ],
      ),
    );
  }
}
