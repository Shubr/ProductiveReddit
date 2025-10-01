import 'package:flutter/material.dart';
import 'dart:ui';

FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

Size size = view.physicalSize;

class sTheme {
  Color primary = Color.fromRGBO(23, 23, 23, 1);
  Color secondary = Color.fromRGBO(145, 145, 145, 1);
  Color border = Color.fromRGBO(69, 69, 69, 1);

  Color green = Color.fromRGBO(98, 217, 50, 1);
  Color red = Color.fromRGBO(217, 50, 50, 1);
  Color blue = Color.fromRGBO(50, 134, 217, 1);
  Color purple = Color.fromRGBO(85, 50, 217, 1);
  Color orange = Color.fromRGBO(217, 103, 50, 1);
  Color yellow = Color.fromRGBO(217, 167, 50, 1);
  Color pink = Color.fromRGBO(217, 50, 206, 1);

  String primaryFont = "InriaSans";
  Size size = view.physicalSize;
}
