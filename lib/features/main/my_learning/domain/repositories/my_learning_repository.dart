import 'package:dartz/dartz.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/assessment_quiz_record.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/assessment_result.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/content.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/learning_detail.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/lesson_quiz_score.dart';

import '../entities/assessment_session.dart';
import '../entities/enrollment_completion.dart';

abstract class MyLearningRepository {
  Future<Either<Failure, List<EnrollmentCompletion>>> getUserEnrollments();
  Future<Either<Failure, LearningDetail>> getLearningDetail(
      String enrollmentId);
  Future<Either<Failure, List<Content>>> getLessonContents(String lessonId);
  Future<Either<Failure, void>> submitLessonCompletion(
      String enrollmentId, String lessonId);
  Future<Either<Failure, AssessmentSession>> createAssessmentSession(
      String enrollmentId, String assessmentId);
  Future<Either<Failure, void>> submitQuiz(String assessmentSessionId,
      List<String> questionIds, List<String> questionChoiceIds);
  Future<Either<Failure, List<LessonQuizScore>>> getUserLessonQuizScores(
      String enrollmentId);
  Future<Either<Failure, List<AssessmentResult>>> getLearningHistory(
      String enrollmentId, String lessonId);
  Future<Either<Failure, AssessmentQuizRecord>> getLearningEvaluation(
      String assessmentSessionId);
}
