import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../constants/strings.dart';

class Utility {
  // Ensure singleton
  static final Utility _instance = Utility._privateConstructor();
  static Utility get instance => _instance;
  Utility._privateConstructor();

  final _strings = Strings.instance;

  String convertDateToString(DateTime date) {
    String formattedDate = _strings.inputFormat.format(date);
    return formattedDate;
  }
}
