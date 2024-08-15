import 'package:dartz/dartz.dart';
import 'package:mico_learn/core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signInGoogle();
}
