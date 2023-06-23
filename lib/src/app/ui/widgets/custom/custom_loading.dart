import 'package:flutter/material.dart';

import '../../../context/app_assets.dart';

class CustomLoadingPage extends StatelessWidget {
  const CustomLoadingPage({
    Key? key,
    this.title = 'Cargando...',
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title ?? ""),
        const SizedBox(height: 20),
        CircularProgressIndicator(
          backgroundColor: AppAssets.whiteColor,
          color: AppAssets.blackColor,
        ),
      ],
    );
  }
}
