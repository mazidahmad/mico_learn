import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/startup/domain/repositories/startup_repository.dart';

import '../../../../core/di/service_locator.dart';

@Injectable()
class IsHasSession {
  final StartupRepository _repo = getIt<StartupRepository>();

  Future<Either<Failure, bool>> execute() => _repo.isHasSession();
}
