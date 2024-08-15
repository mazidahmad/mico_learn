import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class SessionExpiredFailure extends Failure {
  const SessionExpiredFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class DeviceFailure extends Failure {
  const DeviceFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(super.message);

  @override
  List<Object?> get props => [message];
}
