import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@lazySingleton

class ApiService {
  final Dio _dio;

    ApiService(this._dio);

  Future<Response<dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<dynamic>> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.post(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<dynamic>> put({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.put(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<dynamic>> patch({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.patch(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<dynamic>> delete({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.delete(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}