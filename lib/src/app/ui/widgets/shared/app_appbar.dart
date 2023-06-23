import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final String titleP;
  final Widget? leadingWidget;
  final double? fontSize;
  final PreferredSizeWidget? bottomT;
  CustomAppBar(
      {Key? key,
      required this.titleP,
      this.leadingWidget,
      this.fontSize,
      this.bottomT})
      : super(
          key: key,
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 2,
          iconTheme: const IconThemeData(color: Colors.black),
          leading: leadingWidget ?? Container(),
          bottom: bottomT,
          title: Text(
            titleP,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
}
