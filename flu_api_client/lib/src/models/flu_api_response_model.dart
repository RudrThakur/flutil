import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flu_api_client/src/utils/validators.dart';

class FluApiResponse {
  int? statusCode;
  Map<String, dynamic>? data;
  bool? isSuccess;
  Map<String, dynamic>? error;

  FluApiResponse();

  FluApiResponse.fromSuccess(Response response) {
    var jsonStringData = response.data;
    final Map<String, dynamic>? jsonResponse;
    if (isValidJson(jsonStringData)) {
      jsonResponse = json.decode(jsonStringData);
    } else {
      jsonResponse = jsonStringData;
    }
    statusCode = response.statusCode;
    data = jsonResponse;
    isSuccess = true;
  }

  FluApiResponse.fromFailure(Response response) {
    var jsonStringData = response.data;
    final Map<String, dynamic>? jsonResponse;
    if (isValidJson(jsonStringData)) {
      jsonResponse = json.decode(jsonStringData);
    } else {
      jsonResponse = jsonStringData;
    }
    statusCode = response.statusCode;
    data = jsonResponse;
    isSuccess = false;
  }

  FluApiResponse.fromError(DioError dioError) {
    var jsonStringData = dioError.response?.data;
    final Map<String, dynamic>? jsonResponse;
    if (isValidJson(jsonStringData)) {
      jsonResponse = json.decode(jsonStringData);
    } else {
      jsonResponse = jsonStringData;
    }
    statusCode = dioError.response?.statusCode ?? 500;
    error = jsonResponse;
    isSuccess = false;
  }
}
