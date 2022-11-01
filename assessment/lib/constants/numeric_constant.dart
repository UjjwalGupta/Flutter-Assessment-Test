import 'package:get/get.dart';
//
class NumericConstant {
  // Ensure singleton
  static final NumericConstant _instance = NumericConstant._privateConstructor();
  static NumericConstant get instance => _instance;
  NumericConstant._privateConstructor();

  double currentDeviceHeight = Get.mediaQuery.size.height;
  double currentDeviceWidth = Get.mediaQuery.size.width;
  double searchBoxHeight = 60;
  int timeOut = 30;
}
