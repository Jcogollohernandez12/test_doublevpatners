import 'package:flutter/material.dart';

import '../../../context/app_assets.dart';

Widget buildLoadingIndicator() {
  return Container(
    color: AppAssets.whiteColor,
    alignment: Alignment.center,
    child: CircularProgressIndicator(
      backgroundColor: AppAssets.whiteColor,
      color: AppAssets.primaryColor,
    ),
  );
}
