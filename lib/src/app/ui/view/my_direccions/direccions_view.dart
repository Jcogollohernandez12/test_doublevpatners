import 'package:app_test/src/app/ui/widgets/shared/app_appbar.dart';
import 'package:flutter/material.dart';

class MyDirections extends StatelessWidget {
  static const routeName = "/MyDirections";
  const MyDirections({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleP: "Direcciones"),
    );
  }
}
