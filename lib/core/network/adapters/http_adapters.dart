import 'package:dio/io.dart';

class HttpAdapters extends DioForNative {
  HttpAdapters() {
    _configureOptions();
  }

  void _configureOptions() {
    options
      ..baseUrl = 'https://fakestoreapi.com/'
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15);
  }
}
