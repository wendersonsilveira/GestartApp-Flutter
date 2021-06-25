import 'package:Gestart/data/remote/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';

class CustomDio {
  final Dio _dio;
  final AuthInterceptor _authInterceptor;

  CustomDio(this._dio, this._authInterceptor) {
    _dio.options.connectTimeout = 10000;
    _dio.options.sendTimeout = 10000;
    _dio.options.receiveTimeout = 10000;

    _dio.interceptors.add(_authInterceptor);
    _dio.interceptors.add(LogInterceptor(
        requestBody: true, responseBody: true, requestHeader: true));

    _dio.options.baseUrl = "http://api.gestartapp.com.br:8080/gestartapp/";
    // _dio.options.baseUrl = "localhost:";
  }

  Future<T> delete<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
  }) async {
    final res = await _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        extra: extra,
      ),
    );
    return res.data;
  }

  Future<T> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    onReceiveProgress,
  }) async {
    final res = await _dio.get<T>(
      path,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        extra: extra,
      ),
    );
    return res.data;
  }

  Future<T> patch<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    onSendProgress,
    onReceiveProgress,
  }) async {
    final res = await _dio.patch<T>(
      path,
      data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        extra: extra,
      ),
    );
    return res.data;
  }

  Future<T> post<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    onSendProgress,
    onReceiveProgress,
    contentType,
  }) async {
    final res = await _dio.post<T>(
      path,
      data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: Options(
          headers: headers,
          extra: extra,
          contentType:
              contentType != null ? contentType : Headers.jsonContentType),
    );
    return res.data;
  }

  Future<T> put<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    onSendProgress,
    onReceiveProgress,
  }) async {
    final res = await _dio.put<T>(
      path,
      data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        extra: extra,
      ),
    );
    return res.data;
  }
}
