import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/lesson_quiz_score.dart';
import 'package:mico_learn/features/main/my_learning/domain/repositories/my_learning_repository.dart';

@Injectable()
class GetUserLessonQuizScores {
  final MyLearningRepository _repo = getIt<MyLearningRepository>();

  Future<Either<Failure, List<LessonQuizScore>>> execute(String enrollmentId) =>
      _repo.getUserLessonQuizScores(enrollmentId);
}
