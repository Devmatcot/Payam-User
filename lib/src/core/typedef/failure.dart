import 'package:dio/dio.dart';

class Failure {
  final DioError error;

  Failure(this.error);
}
