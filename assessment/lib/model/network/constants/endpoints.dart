class Endpoints {
  static final Endpoints _instance = Endpoints._privateConstructor();
  static Endpoints get instance => _instance;
  Endpoints._privateConstructor();

  // base url
  static String baseUrl = 'http://api.marketstack.com/v1/';
  String eodUrl = '${baseUrl}eod';

  // receiveTimeout
  int receiveTimeout = 15000;
  // connectTimeout
  int connectionTimeout = 30000;

}