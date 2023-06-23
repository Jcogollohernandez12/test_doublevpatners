import 'package:flutter/material.dart';

class AppAssets {
  static AppAssets? _singleton;
  factory AppAssets() => _singleton ??= AppAssets._();

  AppAssets._();

  static String colorLogo = 'assets/logo.png';
  static String navigation = 'assets/navigation.png';
  static String loginBackgroundImage = 'assets/login_background.png';

  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;

  static Color primaryColor = Color.fromARGB(255, 7, 7, 7);
  static Color secondaryColor = const Color(0XFF22593C);
  static Color tertiaryColor = const Color(0xFF006EC0);
}
