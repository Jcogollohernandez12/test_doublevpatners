import 'package:flutter/material.dart';

class AppAssets {
  static AppAssets? _singleton;
  factory AppAssets() => _singleton ??= AppAssets._();

  AppAssets._();

  static String colorLogo = 'assets/logo.png';
  // static String firstOnBoardingImage = 'assets/first_onBoarding_image.png';
  // static String secondOnBoardingImage = 'assets/second_onBoarding_image.png';
  // static String thirdOnBoardingImage = 'assets/third_onBoarding_image.png';
  static String loginBackgroundImage = 'assets/login_background.png';

  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;

  static Color primaryColor = const Color(0XFF03A851);
  static Color secondaryColor = const Color(0XFF22593C);
  static Color tertiaryColor = const Color(0xFF006EC0);
}
