import 'package:dartz/dartz.dart';
import 'package:mico_learn/core/error/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failure, void>> logout();
}
