import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/app/locator.dart';
import 'package:flutter_template/services/core/api_service.dart';

class RetryInterceptor extends Interceptor {
  final ApiService apiService = locator<ApiService>();

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      try {
        return apiService.scheduleRequestRetry(err.requestOptions);
      } catch (e) {
        return e;
      }
    }
    return err;
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }
}
