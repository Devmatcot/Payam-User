import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '/src/core/constants/api_constant.dart';
import '/src/core/network/form_interceptor.dart';

class DioClient {
// dio instance
  final Dio _dio = Dio();

  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<String> refreshToken() async {
    var refreshToken = await storage.read(key: Endpoints.refresh_token);

    var response = await _dio.post(
      Endpoints.refreshToken,
      data: {"refresh": refreshToken},
    );

    if (response.statusCode == 200) {
      print(response.data);
      var accessToken = response.data['data'];
      await storage.write(key: Endpoints.access_token, value: accessToken);
      return accessToken;
    } else {
      return '';
    }
  }

  Future<Response<dynamic>> _retry(
      RequestOptions requestOptions, String token) async {
    final options = Options(
      method: requestOptions.method,
      headers: {'Authorization': 'Bearer $token'},
    );
    print(options.headers);

    if (requestOptions.data is FormData) {
      // https://github.com/flutterchina/dio/issues/482
      FormData formData = FormData();
      formData.fields.addAll(requestOptions.data.fields);
      for (MapEntry mapFile in requestOptions.data.files) {
        formData.files.add(
          MapEntry(
            mapFile.key,
            MultipartFileExtended.fromFileSync(mapFile.value.filePath,
                filename: mapFile.value.filename),
          ),
        );
      }
      requestOptions.data = formData;
    }
    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  DioClient() {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers['content-Type'] = 'application/json'
      ..options.headers['accept'] = 'application/json'
      ..interceptors.add(
          // MyInterceptor()

          InterceptorsWrapper(
        onError: (error, handler) async {
          if (error.response != null) {
            if (error.response!.statusCode == 401 &&
                error.response!.data['code'] == 'unauthorized_user') {
              // if (error.response!.data['detail']['code'] == 'token_not_valid') {
              String token = await refreshToken();
              error.requestOptions.headers['Authorization'] = 'Bearer $token';
              print(error.requestOptions.uri);
              //  handler.resolve(await _dio.fetch(error.requestOptions)); //This Work Fine

              handler.resolve(
                  await _retry(error.requestOptions, token)); //Second Methods;
              // } else {
              // handler.reject(error);
              // }
            } else {
              handler.reject(error);
            }
          } else {
            handler.reject(error);
          }
        },
      ))
      ..options.responseType = ResponseType.json;
  }

  // Get:----------------------------------------------------------------------

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

// Post:----------------------------------------------------------------------

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

// Put:-----------------------------------------------------------------------

  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
