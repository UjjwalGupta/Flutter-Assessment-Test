import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static final AppColors _instance = AppColors._privateConstructor();
  static AppColors get instance => _instance;
  AppColors._privateConstructor(); // Private constructor

  Color backgroundColor = const Color(0xff404F5D);
  Color greenColor = const Color(0xff8AC45A);
  Color deepGreenColor = const Color(0xff4f854e);
  Color blueColor = const Color(0xff237E97);
}
