import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/assessment_quiz_record.dart';
import 'package:mico_learn/features/main/my_learning/domain/repositories/my_learning_repository.dart';

@Injectable()
class GetLearningEvaluation {
  final MyLearningRepository _repo = getIt<MyLearningRepository>();

  Future<Either<Failure, AssessmentQuizRecord>> execute(
          String assessmentSessionId) =>
      _repo.getLearningEvaluation(assessmentSessionId);
}
