import 'package:dio/dio.dart';
import 'package:weather_app/core/const/App.dart';

abstract class ApiClient {
  static final Dio _apiClient = _getDio(baseUrl: '');
  static Dio _getDio({String? baseUrl}) {
    return Dio(BaseOptions(
      baseUrl: baseUrl ?? '',
      connectTimeout: App.apiRequestTimeout,
      contentType: Headers.jsonContentType,
    ));
  }

  static Future<Response> get(
          {required String url, Map<String, dynamic>? params}) async =>
      await _apiClient.get("${App.mainLink}$url", queryParameters: params);
}
