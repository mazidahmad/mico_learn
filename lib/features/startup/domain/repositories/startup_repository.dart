import 'package:dartz/dartz.dart';
import 'package:mico_learn/core/error/failures.dart';

import '../../../auth/domain/entities/account.dart';

abstract class StartupRepository {
  Future<Either<Failure, bool>> isHasSession();
  Future<Either<Failure, Account?>> getAccountInfo();
}
