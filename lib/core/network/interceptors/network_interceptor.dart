import 'package:dio/dio.dart';

class NetworkInterceptor implements Interceptor {
  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    if ([401, 403].contains(error.response?.statusCode)) {}
    return handler.next(error);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
