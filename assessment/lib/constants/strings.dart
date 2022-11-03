import 'package:intl/intl.dart';
class Strings {
// Ensure singleton
  static final Strings _instance = Strings._privateConstructor();
  static Strings get instance => _instance;
  Strings._privateConstructor();

  //General
  String appName = "UjjwalKumarGuptaAssessment";
  String accessKey = "ea55cb63870b33756e1eaab00a8744c3";
  String commonApiError = 'Error occurred while communication with server';
  String loadingText = 'Loading...';
  String typeValueHere = 'Type Volume Here...';
  String noInternetConnection = 'No internet connection';

  // DATE FORMAT
  DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'");
  DateFormat outputFormat = DateFormat("yyyy-MM-dd");
  DateFormat outputFormat2 = DateFormat("dd/MM/yyyy");
}
