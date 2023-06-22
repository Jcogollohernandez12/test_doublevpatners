import 'package:app_test/src/app/ui/view/home/homepage.dart';
import 'package:app_test/src/app/ui/view/register/complete_register.dart';
import 'package:app_test/src/app/ui/view/register/register_user.dart';
import 'package:flutter/material.dart';

import '../ui/view/login/login_view.dart';

class AppRouting {
  static PageRoute<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return _fadeRoute(HomePage(), settings);

      case CompleteRegisterScreen.routeName:
        return _fadeRoute(CompleteRegisterScreen(), settings);

      case RegisterScreen.routeName:
        return _fadeRoute(RegisterScreen(), settings);

      default:
        return _fadeRoute(LoginScreen(), settings);
    }
  }

  static PageRoute _fadeRoute(Widget view, RouteSettings settings) {
    return PageRouteBuilder(
        pageBuilder: (_, __, ___) => view,
        settings: settings,
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (_, animation, __, ___) => FadeTransition(
              opacity: animation,
              child: view,
            ));
  }
}
