import 'package:dio/dio.dart';

abstract class ApiClient {
  final Dio _apiClient = _getDio(baseUrl: '');
  static Dio _getDio({String? baseUrl}) {
    return Dio(BaseOptions(
      baseUrl: baseUrl ?? '',
      connectTimeout: 30000,
      contentType: Headers.jsonContentType,
    ));
  }

  Future<Response> get(
          {required String url, required Map<String, dynamic> params}) async =>
      await _apiClient.get(url, queryParameters: params);
}
