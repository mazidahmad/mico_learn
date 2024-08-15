import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/assessment_session.dart';
import 'package:mico_learn/features/main/my_learning/domain/repositories/my_learning_repository.dart';

import '../../../../../core/di/service_locator.dart';

@Injectable()
class CreateAssessmentSession {
  final MyLearningRepository _repo = getIt<MyLearningRepository>();

  Future<Either<Failure, AssessmentSession>> execute(
          String enrollmentId, String assessmentId) =>
      _repo.createAssessmentSession(enrollmentId, assessmentId);
}
