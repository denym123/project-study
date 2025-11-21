import 'dart:developer';

import 'package:dio/io.dart';
import 'package:testekobe/core/core.dart';

class HttpAdapter extends DioForNative {
  HttpAdapter() {
    _configureOptions();
    _configureInterceptors();
  }

  void _configureOptions() {
    options
      ..baseUrl = 'https://fakestoreapi.com/'
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15);
  }

  void _configureInterceptors() {
    log('Configuring HTTP Interceptors');
    interceptors.addAll([LoggerInterceptor()]);
  }
}
