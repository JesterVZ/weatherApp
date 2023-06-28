import 'package:dio/dio.dart';

abstract class ApiClient{
  final Dio _apiClient = _getDio(baseUrl: '');
  static Dio _getDio({String? baseUrl}) {
    return Dio(BaseOptions(
      baseUrl: baseUrl ?? '',
      connectTimeout: 30000,
      contentType: Headers.jsonContentType,
    ));
  }
  
}