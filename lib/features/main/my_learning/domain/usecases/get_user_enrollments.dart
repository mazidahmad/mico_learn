import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/repositories/my_learning_repository.dart';

import '../entities/enrollment_completion.dart';

@Injectable()
class GetUserEnrollments {
  final MyLearningRepository _repo = getIt<MyLearningRepository>();

  Future<Either<Failure, List<EnrollmentCompletion>>> execute() =>
      _repo.getUserEnrollments();
}
