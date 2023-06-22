import 'package:flutter/material.dart';

import '../../widgets/shared/app_appbar.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/HomePage";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleP: "Inicio"),
    );
  }
}
