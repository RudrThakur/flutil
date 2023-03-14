import 'package:dio/dio.dart';
import 'package:flu_api_client/src/constants/enum.dart';
import 'package:flu_api_client/src/models/flu_api_response_model.dart';

class FluApiClient {
  late Dio _dio;
  // late FluApiInterceptor _apiInterceptor;
  String? _bearerToken;

  FluApiClient() {
    _dio = Dio();
    // _instance._apiInterceptor = FluApiInterceptor();
    // _instance._dio.interceptors.add(_instance._apiInterceptor);
  }

  set setBearerToken(String token) {
    _bearerToken = token;
  }

  String? get getBearerToken => _bearerToken;

  Future<FluApiResponse> openRequest(RequestType requestType, String requestUrl,
      {String? payload}) async {
    try {
      Response? response;

      if (requestType == RequestType.get) {
        response = await _dio.get(requestUrl);
      } else if (requestType == RequestType.post) {
        response = await _dio.post(requestUrl, data: payload);
      }

      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          return FluApiResponse.fromSuccess(response);
        } else {
          return FluApiResponse.fromFailure(response);
        }
      } else {
        return FluApiResponse();
      }
    } on DioError catch (e) {
      return FluApiResponse.fromError(e);
    }
  }

  secureRequest(RequestType requestType, String requestUrl,
      {String? payload}) async {
    try {
      Response? response;

      if (requestType == RequestType.get) {
        response = await _dio.get(requestUrl);
      } else if (requestType == RequestType.post) {
        response = await _dio.post(requestUrl, data: payload);
      }

      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          return FluApiResponse.fromSuccess(response);
        } else {
          return FluApiResponse.fromFailure(response);
        }
      } else {
        return FluApiResponse();
      }
    } on DioError catch (e) {
      return FluApiResponse.fromError(e);
    }
  }
}
