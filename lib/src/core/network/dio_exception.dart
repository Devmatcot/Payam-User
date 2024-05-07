import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        if (dioError.response?.data['message'].toString() != null ||
            dioError.response!.data['error'] ||
            dioError.response!.data.containsKey('errors')) {
          message = dioError.response?.data['message'].toString() ??
              dioError.response!.data['error'].toString();
        } else if (dioError.response?.data['error'].toString() != null) {
          message = dioError.response!.data['error'].toString();
        } else {
          message = _handleError(
            dioError.response?.statusCode,
            dioError.response?.data,
          );
        }

        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          message = 'No Internet Connection / Connection Failure';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error['message'] ?? 'Bad request';
      case 401:
        return error['message'] ?? 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'] ?? '';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
