import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/profile/domain/repository/profile_repository.dart';

@Injectable()
class LogoutAccount {
  final ProfileRepository _repo = getIt<ProfileRepository>();

  Future<Either<Failure, void>> execute() => _repo.logout();
}
