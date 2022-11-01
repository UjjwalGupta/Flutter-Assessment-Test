import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../constants/Strings.dart';
import '../../exceptions/app_exception.dart';

class ResponseFormat {
  // Ensure singleton
  static final ResponseFormat _instance = ResponseFormat._privateConstructor();
  static ResponseFormat get instance => _instance;
  ResponseFormat._privateConstructor();

  final strings = Strings.instance;

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        Get.back();
        throw BadRequestException(response.body.toString());
      case 401:
        Get.back();
        break;
      case 403:
        Get.back();
        throw UnauthorisedException(response.body.toString());
      case 500:
        Get.back();
        break;
      default:
        Get.back();
        throw FetchDataException(
            '${strings.commonApiError} with status code : ${response.statusCode}');
    }
  }
}