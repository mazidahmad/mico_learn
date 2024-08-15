import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/startup/domain/repositories/startup_repository.dart';

import '../../../auth/domain/entities/account.dart';

@Injectable()
class GetAccountInfo {
  final StartupRepository _repo = getIt<StartupRepository>();

  Future<Either<Failure, Account?>> execute() => _repo.getAccountInfo();
}
