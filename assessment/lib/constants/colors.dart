import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static final AppColors _instance = AppColors._privateConstructor();
  static AppColors get instance => _instance;
  AppColors._privateConstructor(); // Private constructor

  Color backgroundColor = const Color(0xff404F5D);
  Color remainingColor = const Color(0xff8AC45A);
  Color remainingColor_ = const Color(0xff8BC45B);
  Color progressColor = const Color(0xff4f854e);
  Color spentColor = const Color(0xff237E97);
}
