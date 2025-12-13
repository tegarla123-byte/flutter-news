import 'package:dio/dio.dart';
import 'package:flutter_news/core/config/flavor_config.dart';

class DioProvider {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: FlavorConfig.instance.newsApiBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'X-Api-Key': FlavorConfig.instance.newsApiKey},
      ),
    );

    dio.interceptors.add(
      LogInterceptor(requestBody: false, responseBody: false),
    );

    return dio;
  }
}
