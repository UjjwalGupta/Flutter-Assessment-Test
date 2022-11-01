import 'package:assesment/model/network/apis/eod/eod_service.dart';
import 'package:assesment/model/repository/eod/eod_model.dart';
import 'package:get/get.dart';

class EODViewModel extends GetxController {
  EODService eodService = EODService();
  EODModel eodModel = EODModel();
  List<Data> companyData = [];
  String fromDate = '2000-01-01';
  String toDate = '2022-06-01';

  void updateFromDate(String date){
    fromDate = date;
    update();
  }

  void updateToDate(String date){
    toDate = date;
    update();
  }

  void filterEodData(String searchText){
  for(Data data in companyData){
    if(data.volume!.toString() == searchText){

    }
  }

    update();
  }

  Future<dynamic> getEodData() async {
    dynamic response =
    await eodService.getEodData(fromDate, toDate);
    eodModel = EODModel.fromJson(response);
    if(eodModel.data != null) {
      companyData.addAll(eodModel.data!);
    }
    update();
  }
}