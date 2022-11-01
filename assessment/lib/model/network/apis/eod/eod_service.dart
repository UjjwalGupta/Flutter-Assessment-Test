import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../../constants/Strings.dart';
import '../../../../utils/ui_helper/ui_helper.dart';
import '../../constants/endpoints.dart';
import '../../exceptions/app_exception.dart';
import '../common/response_format.dart';

class EODService {
  final _strings = Strings.instance;
  final _responseFormat = ResponseFormat.instance;
  final _endpoints = Endpoints.instance;

  Future<dynamic> getEodData(String fromDate, String toDate, {int limit = 10}) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse('${_endpoints.eodUrl}?${_strings.ujjwalAccessKey}&symbols=AAPL&sort=DESC&date_from=$fromDate&date_to=$toDate&limit=$limit'),
        // headers: {
        //   "Content-type": "application/json",
        //   'Authorization': 'Bearer ${_strings.ujjwalAccessKey}'
        // },
      );
      responseJson = _responseFormat.returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException();
    }
  }
}
