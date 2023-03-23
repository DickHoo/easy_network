import 'package:dio/dio.dart';

import 'builder.dart';
import 'retrofit.dart';

class DefaultBuilder implements Builder {
  Dio dio = Dio();

  @override
  Builder baseUrl(String url) {
    dio.options.baseUrl = url;
    return this;
  }

  @override
  Retrofit get build => Retrofit.getInstance();

  @override
  Builder connectTimeout(Duration duration) {
    dio.options.connectTimeout = duration;
    return this;
  }

  @override
  Builder receiveTimeout(Duration duration) {
    dio.options.receiveTimeout = duration;
    return this;
  }

  @override
  Builder openLog() {
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return this;
  }
}
