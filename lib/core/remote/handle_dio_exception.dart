import 'package:dio/dio.dart';

extension DioExceptionExtension on DioException {
  String get message {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out';
      case DioExceptionType.sendTimeout:
        return 'Send timed out';
      case DioExceptionType.receiveTimeout:
        return 'Receive timed out';
      case DioExceptionType.badResponse:
        return 'Bad response: ${response?.statusCode}';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.unknown:
      default:
        return 'Unknown error occurred';
    }
  }
}
