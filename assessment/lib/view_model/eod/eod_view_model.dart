import 'package:assesment/model/network/apis/eod/eod_service.dart';
import 'package:assesment/model/repository/eod/eod_model.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class EODViewModel extends GetxController {
  EODService eodService = EODService();
  EODModel eodModel = EODModel();
  List<Data> companyDataList = [];
  List<Data> tempList = [];
  String fromDate = '2000-01-01';
  String toDate = '2022-06-01';
  bool isInternetConnected = true;

  void updateFromDate(String date) {
    fromDate = date;
    update();
  }

  void updateToDate(String date) {
    toDate = date;
    update();
  }

  void updateInternetConnection(bool status) {
    isInternetConnected = status;
    update();
  }

  void checkInternetConnection(String date) {
    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
         isInternetConnected = true;
         update();
          break;
        case InternetConnectionStatus.disconnected:
          isInternetConnected = false;
          update();
          break;
      }
    });
    update();
  }

  void filterEodData(String searchText) {
    final result = tempList.where((element) {
      final value = element.volume.toString();
      return value.contains(searchText);
    }).toList();
    companyDataList.clear();
    companyDataList.addAll(result);
    update();
  }

  Future<dynamic> getEodData() async {
    dynamic response = await eodService.getEodData(fromDate, toDate);
    if (response != null) {
      eodModel = EODModel.fromJson(response);
      if (eodModel.data != null) {
        companyDataList.clear();
        tempList.clear();
        companyDataList.addAll(eodModel.data!);
        tempList.addAll(eodModel.data!);
      }
    }
    update();
  }
}
