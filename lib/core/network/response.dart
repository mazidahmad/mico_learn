import 'package:equatable/equatable.dart';

enum ResponseStatus { success, failed, timeout }

class ResponseParser<T> extends Equatable {
  final int code;
  final ResponseStatus status;
  final T? data;
  final String message;

  const ResponseParser({
    required this.code,
    required this.status,
    required this.message,
    this.data,
  });

  ResponseParser<T> copyWith({
    int? code,
    ResponseStatus? status,
    T? data,
    String? message,
  }) {
    return ResponseParser<T>(
      code: code ?? this.code,
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [code, status, data, message];
}
