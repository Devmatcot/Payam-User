import '../../../packages.dart';

class MyInterceptor extends Interceptor {
  final Dio _dio = Dio(); // Create a separate Dio instance for token refresh

  FlutterSecureStorage storage = const FlutterSecureStorage();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Add the token to the headers
    String token = await storage.read(key: Endpoints.access_token) ?? "";
    options.headers['Authorization'] = 'Bearer $token';

    // Continue with the request
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_isTokenExpiredError(err)) {
      // Token expired, try to refresh the token
      try {
        await _refreshToken();
        var newToken = await storage.read(key: Endpoints.refresh_token);

        // Update the new token in the original request
        err.requestOptions.headers['Authorization'] = 'Bearer $newToken';

        // Retry the original request with the new token
        final response = await _dio.request(err.requestOptions.path);
        handler.next(err);
      } catch (e) {
        // Token refresh failed, handle the error
        handler.next(err);
      }
    } else {
      // Handle other errors
      handler.next(err);
    }
  }

  bool _isTokenExpiredError(DioError error) {
    // Implement logic to check if the error is due to an expired token
    // You might want to check the status code or response body for specific indicators
    return error.response?.statusCode == 401 &&
        error.response!.data['code'] == 'unauthorized_user';
  }

  // Future<String> _refreshToken() async {
  //   // Implement logic to refresh the token
  //   // Make a network request to your token refresh endpoint
  //   // For example:
  //   // final response = await _dio.post('https://example.com/refresh_token');
  //   // return response.data['new_token'];

  //   // Placeholder for demonstration purposes
  //   await Future.delayed(Duration(seconds: 2));
  //   return 'new_token';
  // }

  Future<void> _refreshToken() async {
    var refreshToken = await storage.read(key: Endpoints.refresh_token);

    var response = await _dio.post(
      Endpoints.refreshToken,
      data: {"refresh": refreshToken},
    );

    if (response.statusCode == 200) {
      print(response.data);
      var accessToken = response.data['data'];
      await storage.write(key: Endpoints.access_token, value: accessToken);
    }
  }
}
