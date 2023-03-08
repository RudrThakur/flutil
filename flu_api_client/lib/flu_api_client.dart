library flu_api_client;

import 'package:dio/dio.dart';

class FluApiClient {
  late Dio _dio;
  late FluApiInterceptor _apiInterceptor;

  FluApiClient() {
    _dio = Dio();
    _apiInterceptor = FluApiInterceptor();
    _dio.interceptors.add(_apiInterceptor);
  }

  openGetRequest() {}

  openPostRequest() {}

  securedGetRequest() {}

  securedPostRequest() {}
}

class FluApiResponse {
  int? statusCode;
  Map<String, dynamic>? data;
  bool? isSuccess;
  DioError? error;
}

class FluApiInterceptor extends Interceptor {}
