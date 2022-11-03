import 'package:assesment/constants/Strings.dart';
import 'package:assesment/constants/colors.dart';
import 'package:assesment/view/eod/eod_companies.dart';
import 'package:assesment/view_model/eod/eod_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<void>  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _strings=Strings.instance;
  final _appColors=AppColors.instance;
  bool isEodViewModelRegistered = Get.isRegistered<EODViewModel>();
bool isFirstTimeChecking = true;
  if(!isEodViewModelRegistered){
    Get.put(EODViewModel(), permanent: true);
  }

  final EODViewModel eodViewModel = Get.find();

  InternetConnectionChecker().onStatusChange.listen((status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        eodViewModel.updateInternetConnection(true);
        break;
      case InternetConnectionStatus.disconnected:
        eodViewModel.updateInternetConnection(false);
        showToast(_strings.noInternetConnection, _appColors);
        break;
    }
  });

  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: _strings.appName,
      home:EodCompanies()));
}

void showToast(String text, AppColors appColors) {
   Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      timeInSecForIosWeb: 2,
      fontSize: 16.0);
}
