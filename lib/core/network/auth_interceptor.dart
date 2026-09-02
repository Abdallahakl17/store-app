import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app/core/error/status_code.dart';
import 'package:store_app/core/services/token_storage_service.dart';
@lazySingleton

class AuthInterceptor extends Interceptor {
  final TokenStorageService _tokenStorageService;

  AuthInterceptor(this._tokenStorageService);
@override
Future<void> onRequest(
  RequestOptions options,
  RequestInterceptorHandler handler,
) async {
  final token = await _tokenStorageService.getToken();

  if (token != null && token.isNotEmpty) {
    options.headers['token'] = token;

    print('TOKEN = $token');
  }

  handler.next(options);
}
  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode ==StatusCode.unauthorized) {
      await _tokenStorageService.deleteToken();
    }

    handler.next(err);
  }
}