import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static Future<void> checkFirstTimeAndNavigate(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      // If it's the first time, set 'isFirstTime' to false and navigate to the onboarding screen
      await prefs.setBool('isFirstTime', false);
      // Navigate to the onboarding screen or any initial screen you want to show only once
      Navigator.pushReplacementNamed(context, '/main');
    } else {
      // If it's not the first time, navigate to the main screen
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
}
