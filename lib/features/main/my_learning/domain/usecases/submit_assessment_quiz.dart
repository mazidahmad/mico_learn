import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/repositories/my_learning_repository.dart';

@Injectable()
class SubmitAssessmentQuiz {
  final MyLearningRepository _repo = getIt<MyLearningRepository>();

  Future<Either<Failure, void>> execute(String assessmentSessionId,
          List<String> questionIds, List<String> questionChoiceIds) =>
      _repo.submitQuiz(assessmentSessionId, questionIds, questionChoiceIds);
}
