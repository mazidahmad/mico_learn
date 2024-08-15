import 'package:dio/dio.dart';
import 'package:mico_learn/core/network/response.dart';

import '../config/app_config.dart';
import '../error/network_exception.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/network_interceptor.dart';

class HttpModule {
  late Dio _client;

  HttpModule({String? baseUrl}) {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl ?? AppConfig.supabaseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    _client = Dio(baseOptions);
    _client.interceptors.addAll([
      LoggingInterceptor(),
      NetworkInterceptor(),
    ]);
  }

  void overrideAuthorizationHeader(String token) {
    _client.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearToken(String token) {
    _client.options.headers.remove('Authorization');
  }

  Future<ResponseParser<dynamic>> _callAdapter(
      Future<Response<dynamic>> method) async {
    try {
      var result = await method;

      if (result.data is List<int>) {
        return ResponseParser(
            code: result.statusCode ?? 0,
            status: ResponseStatus.success,
            data: result.data,
            message: 'Success');
      }

      var code = result.data['data']['status'];
      var message = result.data['data']['message'];
      var data = result.data['data']['data'];

      if (code == null) {
        throw ClientException(errMessage: message);
      } else if (code >= 400 && code < 500) {
        if (data is List) {
          throw RequestException(
              errMessage: data.firstOrNull ?? 'Something went wrong');
        }
        throw RequestException(errMessage: message);
      } else if (code >= 500) {
        throw ServerException(errMessage: message);
      }

      return ResponseParser(
          code: result.statusCode ?? code ?? 0,
          status: ResponseStatus.success,
          data: data,
          message: result.statusMessage ?? message ?? 'Success');
    } on DioException catch (err) {
      String message =
          err.response?.statusMessage ?? err.message ?? 'Something Went Wrong';
      int? errCode = err.response?.statusCode;

      List<DioExceptionType> dioTimeout = [
        DioExceptionType.sendTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.connectionTimeout,
      ];

      if (dioTimeout.any((e) => err.type == e)) {
        throw NetworkException(errMessage: message);
      }

      if (errCode == null) {
        throw ClientException(errMessage: message);
      } else if (errCode >= 400 && errCode < 500) {
        if (errCode == 401) {
          throw const SessionException();
        }
        throw RequestException(errMessage: message);
      } else if (errCode >= 500) {
        throw ServerException(errMessage: message);
      } else {
        throw ClientException(errMessage: message);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseParser<dynamic>> _callAdapterV2(
      Future<Response<dynamic>> method) async {
    try {
      var result = await method;

      var code = result.statusCode;
      var message = result.statusMessage;
      var data = result.data;

      if (code == null) {
        throw ClientException(errMessage: message);
      } else if (code >= 400 && code < 500) {
        if (data is List) {
          throw RequestException(errMessage: data.first);
        }
        throw RequestException(errMessage: message);
      } else if (code >= 500) {
        throw ServerException(errMessage: message);
      }

      return ResponseParser(
          code: result.statusCode ?? code,
          status: ResponseStatus.success,
          data: data,
          message: result.statusMessage ?? message ?? 'Success');
    } on DioException catch (err) {
      String message = err.message ?? 'Something Went Wrong';
      int? errCode = err.response?.statusCode;

      List<DioExceptionType> dioTimeout = [
        DioExceptionType.sendTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.connectionTimeout,
      ];

      if (dioTimeout.any((e) => err.type == e)) {
        throw NetworkException(errMessage: message);
      }

      if (errCode == null) {
        throw ClientException(errMessage: message);
      } else if (errCode >= 400 && errCode < 500) {
        if (errCode == 401) {
          throw const SessionException();
        }
        throw RequestException(errMessage: message);
      } else if (errCode >= 500) {
        throw ServerException(errMessage: message);
      } else {
        throw ClientException(errMessage: message);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseParser<dynamic>> sendPostRequest(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic data,
    void Function(int, int)? onSendProgress,
  }) async {
    var response = await _callAdapter(
      _client.post(
        path,
        data: data,
        queryParameters: params,
        options: Options(headers: headers),
        onSendProgress: onSendProgress,
      ),
    );

    return response;
  }

  Future<ResponseParser<dynamic>> sendPatchRequest(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic data,
    void Function(int, int)? onSendProgress,
  }) async {
    var response = await _callAdapter(
      _client.patch(
        path,
        data: data,
        queryParameters: params,
        options: Options(headers: headers),
        onSendProgress: onSendProgress,
      ),
    );

    return response;
  }

  Future<ResponseParser<dynamic>> sendGetRequest(
    String path, {
    Map<String, dynamic>? headers,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {
    var response = await _callAdapter(
      _client.get(
        path,
        onReceiveProgress: onReceiveProgress,
        options: options ?? Options(headers: headers),
      ),
    );

    return response;
  }

  Future<ResponseParser<dynamic>> sendPutRequest(
    String path, {
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    var response = await _callAdapter(
      _client.put(
        path,
        data: data,
        options: Options(headers: headers),
      ),
    );

    return response;
  }

  Future<ResponseParser<dynamic>> sendDeleteRequest(
    String path, {
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    var response = await _callAdapter(
      _client.delete(
        path,
        data: data,
        options: Options(headers: headers),
      ),
    );

    return response;
  }

  Future<ResponseParser<dynamic>> get(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    var response = await _callAdapterV2(_client.get(
      path,
      options: Options(headers: headers),
    ));

    return response;
  }
}
