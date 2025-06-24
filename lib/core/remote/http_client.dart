import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:space_x/core/remote/http_reqest.dart';

class HttpClient implements HttpRequest {
  final Dio dio;
  HttpClient(this.dio) {
    dio.interceptors.add(interceptorsRequest());
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
  }

  InterceptorsWrapper interceptorsRequest() => InterceptorsWrapper(
    onRequest: (options, handler) async {
      // Add any request interceptors here
      options.headers['Content-Type'] = 'application/json';
      options.headers["x-api-key"] = "ANY";
      options.headers['Accept-Language'] = "EN";
      return handler.next(options);
    },
    onResponse: (response, handler) {
      // Add any response interceptors here
      return handler.next(response);
    },
    onError: (DioException e, handler) {
      // Handle errors globally
      return handler.next(e);
    },
  );

  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    var resendResponse = await _createOperation(
      requestOptions.path,
      method: requestOptions.method,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      headers: requestOptions.headers,
    );
    return resendResponse;
  }

  Future<Response> _createOperation(
    String path, {
    required String method,
    data,
    headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response result = await dio.request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(method: method, headers: headers),
    );
    return result;
  }

  @override
  Future<Response> get(String path, {dynamic headers, dynamic query}) async {
    return await _createOperation(
      path,
      method: "GET",
      headers: headers,
      queryParameters: query,
    );
  }

  @override
  Future<Response> post(String path, {dynamic headers, dynamic body}) async {
    return await _createOperation(
      path,
      method: "POST",
      headers: headers,
      data: body,
    );
  }
}
