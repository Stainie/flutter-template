import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/models/network/api_error.dart';
import 'package:flutter_template/models/network/api_result.dart';
import 'package:flutter_template/models/network/interceptors/retry_interceptor.dart';
import 'package:flutter_template/state/api_urls.dart';

enum HttpMethod { get, post, put, delete, patch }

extension on HttpMethod {
  String get name {
    switch (this) {
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
      case HttpMethod.delete:
        return 'DELETE';
      case HttpMethod.patch:
        return 'PATCH';
    }
  }
}

class ApiService {
  final Connectivity _connectivity = Connectivity();
  final Dio _client = Dio(BaseOptions(
    baseUrl: apiHost,
    contentType: 'application/json',
    connectTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
  ))
    ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true))
    ..interceptors.add(RetryInterceptor());

  Future<ApiResult<T>> request<T>(
    String path,
    HttpMethod method, {
    String? token,
    bool addAcceptHeader = true,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T onSuccess(Response<dynamic> response),
  }) async {
    final Options options = Options(method: method.name);
    // final String? token = authService.getToken();
    if (token != null) options.headers?['Authorization'] = 'Bearer $token';
    if (addAcceptHeader) options.headers?['Accept'] = 'application/json';

    try {
      final Response<dynamic> response = await _client.request(
        path,
        options: options,
        queryParameters: queryParameters,
        data: data,
      );

      return ApiResult<T>.success(onSuccess(response));
    } on DioException catch (e) {
      print('[API] Dio error! Error: ${e.type}');
      print('[API] Proceeding to parse Dio error.');
      try {
        final Map<String, dynamic> errorData =
            e.response?.data as Map<String, dynamic>;
        final ApiError error = ApiError.fromJson(errorData);
        print('[API] Parsed Dio error!');
        return ApiResult<T>.error(
            error.copyWith(statusCode: e.response!.statusCode!));
      } catch (e) {
        print('[API] Failed parsing Dio Error! Rethrowing!');
        const ApiError error =
            ApiError('Unsuccessfully tried parsing error message.', 520);
        return ApiResult<T>.error(error);
      }
    } catch (e) {
      print('[API] General error: $e');
      const ApiError error = ApiError('An unspecified error occurred.', 520);
      return ApiResult<T>.error(error);
    }
  }

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    final responseCompleter = Completer<Response>();
    StreamSubscription? streamSubscription;

    streamSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none) {
        streamSubscription!.cancel();
        responseCompleter.complete(_client.request(requestOptions.path,
            options: Options(method: requestOptions.method),
            queryParameters: requestOptions.queryParameters,
            data: requestOptions.data));
      }
    });
    return responseCompleter.future;
  }
}
