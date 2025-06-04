import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final Dio dio = Dio();

  Future<Response> getData({
    required String baseUrl,
    required String endPoints,
    Map<String, dynamic>? queryParams,
  }) async {
    return dio.get(baseUrl + endPoints, queryParameters: queryParams);
  }

  Future<Response> postData({
    required String baseUrl,
    required String endPoints,
    Map<String, dynamic>? queryParams,
    Object? data,
  }) async {
    return dio.post(
      baseUrl + endPoints,
      queryParameters: queryParams,
      data: data,
      options: Options(validateStatus: (status) => true),
    );
  }
}
