import 'package:dio/dio.dart';

import '../../app/data/model/error_msg.dart';

extension DioExceptionExtension on DioException {
  ErrorMsg toAppError() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return ErrorMsg('connectionTimeout');
      case DioExceptionType.receiveTimeout:
        return ErrorMsg('receiveTimeout');
      default:
        return ErrorMsg(response?.statusCode.toString() ?? message.toString());
    }
  }
}
