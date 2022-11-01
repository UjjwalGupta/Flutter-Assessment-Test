import 'package:intl/intl.dart';
class Strings {
// Ensure singleton
  static final Strings _instance = Strings._privateConstructor();
  static Strings get instance => _instance;
  Strings._privateConstructor();

  //General
  String appName = "UjjwalKumarGuptaAssessment";
  String ujjwalAccessKey = "ea55cb63870b33756e1eaab00a8744c3";
  String commonApiError = 'Error occurred while communication with server';
  String loadingText = 'Loading...';

  // DATE FORMAT
  DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'");
  DateFormat inputFormat2 = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
  DateFormat inputFormat3 = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
  DateFormat outputFormat = DateFormat("yyyy-MMM-dd");
  DateFormat outputFormat2 = DateFormat("dd/MM/yyyy");
  DateFormat outputFormat3 = DateFormat("dd MMM yyyy");
  DateFormat outputFormat4 = DateFormat("yyyy-MM-dd");
  DateFormat outputFormat5 = DateFormat("dd/MM/yyyy h:mm a");
}
