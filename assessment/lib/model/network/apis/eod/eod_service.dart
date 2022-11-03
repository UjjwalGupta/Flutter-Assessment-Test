import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../../constants/Strings.dart';
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
      final queryParameters = {
        'access_key': _strings.accessKey,
        'symbols': 'AAPL',
        'sort': 'ASC',
        'date_from': fromDate,
        'date_to': toDate,
        'limit': limit.toString(),
      };
      final uri = Uri.parse(_endpoints.eodUrl).replace(queryParameters: queryParameters);
      final response = await http.get(uri);
      responseJson = _responseFormat.returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException();
    }
  }
}
