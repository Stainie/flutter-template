import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/app/locator.dart';
import 'package:flutter_template/services/core/api_service.dart';

class RetryInterceptor extends Interceptor {
  final ApiService apiService = locator<ApiService>();

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      try {
        return apiService.scheduleRequestRetry(err.requestOptions);
      } catch (e) {
        return e;
      }
    }
    return err;
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.unknown &&
        err.error != null &&
        err.error is SocketException;
  }
}
