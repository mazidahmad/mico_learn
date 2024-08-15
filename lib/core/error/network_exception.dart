abstract class ApiException implements Exception {
  final String type;
  final String message;

  const ApiException(this.type, this.message);

  @override
  String toString() => '$type: $message';
}

class ClientException extends ApiException {
  final String? errMessage;

  const ClientException({this.errMessage})
      : super('Client Error', errMessage ?? 'Something went wrong from Client');
}

class ServerException extends ApiException {
  final String? errMessage;

  const ServerException({this.errMessage})
      : super('Server Error', errMessage ?? 'Something went wrong from Server');
}

class TimeoutException extends ApiException {
  final String? errMessage;
  TimeoutException({this.errMessage})
      : super('Timeout', errMessage ?? 'Request Timeout');
}

class NetworkException extends ApiException {
  final String? errMessage;
  const NetworkException({this.errMessage})
      : super('Network Error',
            errMessage ?? 'Something went wrong on Network Connection');
}

class UnauthorizedException extends ApiException {
  final String? errMessage;
  UnauthorizedException({this.errMessage})
      : super('Unauthorized Request', errMessage ?? 'Unauthorized Request');
}

class RequestException extends ApiException {
  final String? errMessage;
  const RequestException({this.errMessage})
      : super('Request Error', errMessage ?? 'Error Request to Server');
}

class SessionException extends ApiException {
  final String? errMessage;
  const SessionException({this.errMessage})
      : super('Request Error', 'Session Expired, Please Relogin');
}
