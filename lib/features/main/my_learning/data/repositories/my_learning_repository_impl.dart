import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/core/mixin/repository_mixin.dart';
import 'package:mico_learn/features/main/home/data/datasources/module_remote_datasource.dart';
import 'package:mico_learn/features/main/my_learning/data/datasources/my_learning_remote_datasource.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/assessment_quiz_record.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/assessment_result.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/assessment_session.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/content.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/enrollment_completion.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/learning_detail.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/lesson_quiz_score.dart';
import 'package:mico_learn/features/main/my_learning/domain/repositories/my_learning_repository.dart';

import '../../../../../core/di/service_locator.dart';

@Injectable(as: MyLearningRepository)
class MyLearningRepositoryImpl extends MyLearningRepository
    with RepositoryMixin {
  final MyLearningRemoteDatasource _remoteDatasource =
      getIt<MyLearningRemoteDatasource>();
  final ModuleRemoteDatasource _moduleRemoteDatasource =
      getIt<ModuleRemoteDatasource>();

  @override
  Future<Either<Failure, List<EnrollmentCompletion>>> getUserEnrollments() =>
      callDataSource(() => _remoteDatasource.getUserEnrollments());

  @override
  Future<Either<Failure, LearningDetail>> getLearningDetail(
          String enrollmentId) =>
      callDataSource(
        () async {
          var (enrollment, course) =
              await _remoteDatasource.getUserEnrollment(enrollmentId);
          var modules =
              await _moduleRemoteDatasource.getModulesByCourseId(course.id);
          var enrollmentLessons =
              await _remoteDatasource.getEnrollmentLessons(enrollmentId);

          modules.sort((a, b) => a.sequenceNumber.compareTo(b.sequenceNumber));
          enrollmentLessons
              .sort((a, b) => a.sequenceNumber.compareTo(b.sequenceNumber));

          return LearningDetail(
            enrollment: enrollment,
            course: course,
            modules: modules,
            enrollmentLessons: enrollmentLessons,
          );
        },
      );

  @override
  Future<Either<Failure, List<Content>>> getLessonContents(String lessonId) =>
      callDataSource(() => _remoteDatasource.getLessonContents(lessonId));

  @override
  Future<Either<Failure, void>> submitLessonCompletion(
          String enrollmentId, String lessonId) =>
      callDataSource(() =>
          _remoteDatasource.submitLessonCompleted(lessonId, enrollmentId));

  @override
  Future<Either<Failure, AssessmentSession>> createAssessmentSession(
          String enrollmentId, String assessmentId) =>
      callDataSource(() => _remoteDatasource.createAssessmentSession(
          enrollmentId, assessmentId));

  @override
  Future<Either<Failure, void>> submitQuiz(String assessmentSessionId,
          List<String> questionIds, List<String> questionChoiceIds) =>
      callDataSource(() => _remoteDatasource.submitQuiz(
          assessmentSessionId, questionIds, questionChoiceIds));

  @override
  Future<Either<Failure, List<LessonQuizScore>>> getUserLessonQuizScores(
          String enrollmentId) =>
      callDataSource(
          () => _remoteDatasource.getUserLessonQuizScores(enrollmentId));

  @override
  Future<Either<Failure, List<AssessmentResult>>> getLearningHistory(
          String enrollmentId, String lessonId) =>
      callDataSource(
          () => _remoteDatasource.getLearningHistory(lessonId, enrollmentId));

  @override
  Future<Either<Failure, AssessmentQuizRecord>> getLearningEvaluation(
          String assessmentSessionId) =>
      callDataSource(
          () => _remoteDatasource.getLearningEvaluation(assessmentSessionId));
}
