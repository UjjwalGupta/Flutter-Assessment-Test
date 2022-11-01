import 'package:assesment/view/eod/eod_companies.dart';
import 'package:assesment/view_model/eod/eod_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  bool isEodViewModelRegistered = Get.isRegistered<EODViewModel>();
  if(!isEodViewModelRegistered){
    Get.put(EODViewModel(), permanent: true);
  }

  runApp(EodCompanies());
}
