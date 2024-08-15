import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/auth/domain/repositories/auth_repository.dart';

@Injectable()
class SignInGoogle {
  final AuthRepository _repo = getIt<AuthRepository>();

  Future<Either<Failure, void>> execute() => _repo.signInGoogle();
}
