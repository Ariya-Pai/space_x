import 'package:dio/dio.dart';

abstract class HttpRequest {
  Future<Response> get(String path, {dynamic headers, dynamic query});

  Future<Response> post(String path, {dynamic headers, dynamic body});
}
